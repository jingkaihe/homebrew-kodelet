class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.19.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.19.beta/kodelet-darwin-arm64"
      sha256 "495df28c9bdaaa0c87a9b9767959ada7c0eb95cc25d4db0469a1a995c95754ca"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.19.beta/kodelet-darwin-amd64"
      sha256 "72e204dfbeae7d1fc16f0398cbbe2b4256dc5ae5393896f8985d329bfb0911f3"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.19.beta/kodelet-linux-arm64"
      sha256 "d2c797f287e17386ff9f5df5b17533d23ddc24e685ed57cf090a43ad226607a1"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.19.beta/kodelet-linux-amd64"
      sha256 "334805b17434d0155e158e11ba4263b7cab8b5716612da12a9560b8fb9a41414"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
