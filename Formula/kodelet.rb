class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.29.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.29.beta/kodelet-darwin-arm64"
      sha256 "bd49a97650c9f0d3a8b203fe089d128d8ece33b7db25fc64b8866a8545a21b21"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.29.beta/kodelet-darwin-amd64"
      sha256 "97bac5b23afbc9715658d5d49f3ad5af75fb8b1bcc931295a468a6f1bbffb9b0"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.29.beta/kodelet-linux-arm64"
      sha256 "db2b822429d8798574c86354a9bc7684cfe88e0774b9b61716aad2c92e786b23"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.29.beta/kodelet-linux-amd64"
      sha256 "83a608b15e9a0cc62559c4d1d9d2cd6a7cf1be1ea1e2436fa9d858d5832e49b3"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
