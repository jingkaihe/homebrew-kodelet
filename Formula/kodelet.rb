class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.30.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.30.beta/kodelet-darwin-arm64"
      sha256 "1e064f3608d45df3ac85a84a8d137e7ce20f787363aef0e8c3a1273f6f8f3d9f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.30.beta/kodelet-darwin-amd64"
      sha256 "c716bef4a402cc91ced74267e036a920dc9aa41529def072b54647d06d85c17a"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.30.beta/kodelet-linux-arm64"
      sha256 "47e7385964dc99dab5c8b16ab982c61270bc18415c7a59233e31013a39e7432b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.30.beta/kodelet-linux-amd64"
      sha256 "20c7a45afbd2c2dd17efef7d2dcebca2e349bfa8c7e204177ec88685a791061b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
