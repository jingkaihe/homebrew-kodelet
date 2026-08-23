class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.37-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.37-beta/kodelet-darwin-arm64"
      sha256 "7e52af48bc1aba658f73c27e7e3f7b1cefc1ecf3b7700cf73f92bf36609c559f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.37-beta/kodelet-darwin-amd64"
      sha256 "98affcf59389e793f5474a7cd8588c9f9385183643d1dcf9d009f86d8282a333"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.37-beta/kodelet-linux-arm64"
      sha256 "98cbbc220387f8c5b1c91e6966b79472b96f60edd3eb94bfbd41e16c441f2619"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.37-beta/kodelet-linux-amd64"
      sha256 "a0bd51f4f4ada2ae5d56df9d219b79a1567ec2c0c8b29014520af658e985cb58"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
