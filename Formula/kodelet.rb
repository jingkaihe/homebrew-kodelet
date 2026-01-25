class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.2.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.2.beta/kodelet-darwin-arm64"
      sha256 "83b2efd00783832e1d6f6488a6f6b668cca52530923f0b6bce12b0b97c82f276"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.2.beta/kodelet-darwin-amd64"
      sha256 "f3c33f070b446df456c594e02f0bf5003e2c66391614c26bebffb55b4bfca7da"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.2.beta/kodelet-linux-arm64"
      sha256 "380ac261c1f1bc696f5fbf53a9efa6338aa048dd00d5e14d231816df94b66994"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.2.beta/kodelet-linux-amd64"
      sha256 "a17bfc3928c549c3e2515c78a2ff7f4283c5bfa24650b5ecd243a49ab2507420"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
