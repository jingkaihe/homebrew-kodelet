class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.34-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.34-beta/kodelet-darwin-arm64"
      sha256 "99c8b1712e15144c811637d02babf486317da0d6e0a7329cbe7ff51896339f31"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.34-beta/kodelet-darwin-amd64"
      sha256 "0445c7fa15b75cdf89cd9333543500cbfd93bbe6e12c6b2683ba33bd70ba3926"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.34-beta/kodelet-linux-arm64"
      sha256 "4c5f2999b89b1b786283c6d4161e66da4e45fdc086efc7a927e4cc40b8059fb7"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.34-beta/kodelet-linux-amd64"
      sha256 "acb80230e9407570f28d3930f9cf7e501fa0b7808e8156ae2ce976ebdf9b8745"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
