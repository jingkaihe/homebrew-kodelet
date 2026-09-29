class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.7.2-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.2-beta/kodelet-darwin-arm64"
      sha256 "ecc15940e445523bcd6acfb7e1d398a0050f0656de1f26b3ed23f2f713648405"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.2-beta/kodelet-darwin-amd64"
      sha256 "4989712f11856344c6a977a32269ac1a45fb68c2a755934e2ee233a6d55957f2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.2-beta/kodelet-linux-arm64"
      sha256 "8bf98ad107ff99ddd76256203937f420ef7ebf453f9e20aa6030ab8d46780e2b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.2-beta/kodelet-linux-amd64"
      sha256 "6be1bacf903655ba3b3b2e5acfc2ca48c34824e04b261b512c01acfa1e938578"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
