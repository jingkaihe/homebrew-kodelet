class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.34.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.34.beta/kodelet-darwin-arm64"
      sha256 "0345c6677c36c1072d7a187b62b7fdf63a0db51a8102a460be5d0261fc26c861"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.34.beta/kodelet-darwin-amd64"
      sha256 "a336f3dfc474543e9e1f70e6f2cadbe881c18b3552fea428a683efb7cba9cf26"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.34.beta/kodelet-linux-arm64"
      sha256 "c88e6893d58f1c9ecfade59f6448f0d3fafaee14e8a2b4dc82a8d9dc866e66ba"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.34.beta/kodelet-linux-amd64"
      sha256 "6f6c9d4d7f71d96a7f9854506ca3f7d6d5ba217f31557034bfb59a61930804bf"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
