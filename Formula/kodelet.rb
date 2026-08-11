class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.30-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.30-beta/kodelet-darwin-arm64"
      sha256 "35729130d5ccafe6e18d98a5365df4b9d2e2891f405a27f754ce5945baf9044a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.30-beta/kodelet-darwin-amd64"
      sha256 "9d677a4359175051e5eb92a9d387f20453085058bbbf87ce3815cc3822939e5b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.30-beta/kodelet-linux-arm64"
      sha256 "0f750e8afbc44c2bf9e444566b48343957689fcc0cf8108ccfb8127eb7013705"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.30-beta/kodelet-linux-amd64"
      sha256 "c4fd4efcabea506dfef3dfb1105210dcfac58ebb3b26924f06a5b9e63bfb1e55"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
