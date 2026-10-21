class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.9-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.9-beta/kodelet-darwin-arm64"
      sha256 "c4421de2dbe3eb19f47f253327ee437ba7cb15c15e0bdcfc22b040342295946c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.9-beta/kodelet-darwin-amd64"
      sha256 "526d7e2c2da88e04e1406da2b43531e8b1c49dde347f073a9b432564c4371488"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.9-beta/kodelet-linux-arm64"
      sha256 "13bcf05defc94d949bd15ed5c3aef359169d5003a192142e325e90f87986bb63"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.9-beta/kodelet-linux-amd64"
      sha256 "841ce4c4d119c8dcc0fa308a43c4f4a45316d3b0d539171084e63a0a1cf43ef7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
