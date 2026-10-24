class KodeletAudio < Formula
  desc "Native audio helper for Kodelet dictation and voice conversations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "{{VERSION}}"
  license "MIT"

  depends_on "glib"
  depends_on "gstreamer"
  depends_on "opus"

  on_macos do
    depends_on arch: :arm64
    depends_on "gettext"
    depends_on macos: :sequoia

    on_arm do
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-audio-darwin-arm64"
      sha256 "{{SHA256_DARWIN_ARM64}}"
    end
  end

  on_linux do
    depends_on "patchelf" => :build
    depends_on "alsa-lib"

    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-audio-linux-arm64"
      sha256 "{{SHA256_LINUX_ARM64}}"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-audio-linux-amd64"
      sha256 "{{SHA256_LINUX_AMD64}}"
    end
  end

  def install
    bin.install Dir["kodelet-audio-*"].first => "kodelet-audio"
    chmod 0755, bin/"kodelet-audio"

    if OS.linux?
      libexec.install bin/"kodelet-audio"
      libraries = %w[alsa-lib glib gstreamer opus].map { |name| formula_opt_lib(name) }
      libraries << (HOMEBREW_PREFIX/"lib")
      system "patchelf",
             "--set-interpreter", HOMEBREW_PREFIX/"lib/ld.so",
             "--set-rpath", libraries.join(":"), libexec/"kodelet-audio"

      multiarch = Hardware::CPU.arm? ? "aarch64-linux-gnu" : "x86_64-linux-gnu"
      (bin/"kodelet-audio").write <<~SH
        #!/bin/sh
        # Homebrew's ALSA needs the host's PipeWire/PulseAudio plugin directory.
        if [ "${ALSA_PLUGIN_DIR+x}" != x ]; then
          for directory in /usr/lib64/alsa-lib /usr/lib/#{multiarch}/alsa-lib /usr/lib/alsa-lib; do
            if [ -r "$directory/libasound_module_pcm_pipewire.so" ] ||
               [ -r "$directory/libasound_module_pcm_pulse.so" ]; then
              export ALSA_PLUGIN_DIR="$directory"
              break
            fi
          done
        fi
        # Avoid the upstream 441-frame/four-period mismatch at 44.1 kHz.
        if [ "${PIPEWIRE_ALSA+x}" != x ]; then
          export PIPEWIRE_ALSA='{ alsa.rate = 48000 }'
        fi
        exec "#{libexec}/kodelet-audio" "$@"
      SH
      chmod 0755, bin/"kodelet-audio"
    end
  end

  def caveats
    on_linux do
      <<~EOS
        Linux needs a system audio server and its ALSA plugin (e.g. pipewire-alsa).
        The helper detects plugins and defaults PipeWire to 48 kHz, preserving
        explicit ALSA_PLUGIN_DIR and PIPEWIRE_ALSA settings.
        For Bluetooth transport failures, try non-Bluetooth input/output.
      EOS
    end
  end

  test do
    assert_match "kodelet-audio ", shell_output("#{bin}/kodelet-audio --version")

    if OS.linux?
      # Exercise the launcher without opening devices or changing the installed helper.
      helper = testpath/"fake-helper"
      helper.write <<~SH
        #!/bin/sh
        printf '%s\\n' "${ALSA_PLUGIN_DIR-unset}" "${PIPEWIRE_ALSA-unset}" "$@"
        exit 7
      SH
      chmod 0755, helper
      plugins = testpath/"plugins"
      plugins.mkpath
      (plugins/"libasound_module_pcm_pipewire.so").write ""
      launcher = testpath/"launcher"
      launcher.write (bin/"kodelet-audio").read
        .sub("#{libexec}/kodelet-audio", helper.to_s)
        .sub("/usr/lib64/alsa-lib", plugins.to_s)
      chmod 0755, launcher

      output = shell_output("env -u ALSA_PLUGIN_DIR -u PIPEWIRE_ALSA #{launcher} 'two words' --version", 7)
      assert_equal [plugins.to_s, "{ alsa.rate = 48000 }", "two words", "--version"], output.lines.map(&:chomp)

      output = shell_output("env ALSA_PLUGIN_DIR=/custom/plugins PIPEWIRE_ALSA='{alsa.rate=96000}' #{launcher}", 7)
      assert_equal ["/custom/plugins", "{alsa.rate=96000}"], output.lines.map(&:chomp)

      output = shell_output("env ALSA_PLUGIN_DIR= PIPEWIRE_ALSA= #{launcher}", 7)
      assert_equal ["", ""], output.lines.map(&:chomp)
    end
  end
end
