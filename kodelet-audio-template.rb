class KodeletAudio < Formula
  desc "Native audio helper for Kodelet dictation and voice conversations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "{{VERSION}}"
  license "MIT"

  depends_on "glib"
  depends_on "gstreamer"
  depends_on "opus"

  on_macos do
    depends_on "gettext"
    depends_on macos: :sequoia

    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-audio-darwin-arm64"
      sha256 "{{SHA256_DARWIN_ARM64}}"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-audio-darwin-amd64"
      sha256 "{{SHA256_DARWIN_AMD64}}"
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
      libraries = %w[alsa-lib glib gstreamer opus].map { |name| formula_opt_lib(name) }
      libraries << (HOMEBREW_PREFIX/"lib")
      system "patchelf",
             "--set-interpreter", HOMEBREW_PREFIX/"lib/ld.so",
             "--set-rpath", libraries.join(":"), bin/"kodelet-audio"
    end
  end

  test do
    assert_match "kodelet-audio ", shell_output("#{bin}/kodelet-audio --version")
  end
end
