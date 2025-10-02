class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.7.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.7.beta/kodelet-darwin-arm64"
      sha256 "54522ab36a85015806d5e8873b8ba58a51ed62ae76d52bf2cf28af2aeb92dec0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.7.beta/kodelet-darwin-amd64"
      sha256 "429bdb0f5b651f865d59b601ce819fff8f70be49ccdfd8a3c6ed2c3f0842bfa3"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.7.beta/kodelet-linux-arm64"
      sha256 "2307230d00852cc2efbc68cfe19290b68376615bb6f06b46b5f36993d1e3d4c9"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.7.beta/kodelet-linux-amd64"
      sha256 "f06e3db7d3fc360c6cb88b6ca16470ee844d74d7a6bad1719236877be8c4a6ec"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
