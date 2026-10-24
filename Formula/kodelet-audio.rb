class KodeletAudio < Formula
  desc "Native audio helper for Kodelet dictation and voice conversations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.11-beta"
  license "MIT"

  depends_on "glib"
  depends_on "gstreamer"
  depends_on "opus"

  on_macos do
    depends_on "gettext"
    depends_on macos: :sequoia

    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.11-beta/kodelet-audio-darwin-arm64"
      sha256 "0759e5af5031da938234c07a58cb615e01ad55c6f1ad8099fe2777fc37624277"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.11-beta/kodelet-audio-darwin-amd64"
      sha256 "773059778c8288f50e4dfe585422f4206686b71bc5a517b8e6bde7aefcbe78b2"
    end
  end

  on_linux do
    depends_on "patchelf" => :build
    depends_on "alsa-lib"

    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.11-beta/kodelet-audio-linux-arm64"
      sha256 "92563e69a4d007047827e22f23a40190e76d0bef41db455dfbfc6b0f599a6290"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.11-beta/kodelet-audio-linux-amd64"
      sha256 "fb490fb176e6b1f2b339341e6bfd3513626c12200cf149c82c90857dc6a626fa"
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
