class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.11-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.11-beta/kodelet-darwin-arm64"
      sha256 "c4f32c8dbdfaedb877984ef3300ef711c94270ee15b2f87e94b74eecdeaf9485"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.11-beta/kodelet-darwin-amd64"
      sha256 "864f93d866d58d53fe2248571e94614e406c42b989031efd783b8018f665c8e6"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.11-beta/kodelet-linux-arm64"
      sha256 "0a92cc9deb191cfecc744cc214fec846840b65f2653f06f3aa076b5afc30c065"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.11-beta/kodelet-linux-amd64"
      sha256 "b0ce2c52de3cb6c52b9f73bffdd8d1a1424189b287e86155a4dde0e74b1e3373"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
