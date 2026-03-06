class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.3.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.3.beta/kodelet-darwin-arm64"
      sha256 "ed5d24414ea4a69db8a990924b6578b46c198ecef768d8091cd068ccfda29111"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.3.beta/kodelet-darwin-amd64"
      sha256 "afeaac1703512d7678660abb06e709105233c9c657d77247e0dcb6b2e5e4bd16"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.3.beta/kodelet-linux-arm64"
      sha256 "d05103793fe6af6e5bd929361d5e1e91d38313c64a5a28064006afb754742e33"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.3.beta/kodelet-linux-amd64"
      sha256 "5bb55fd04374459abaf502d9a1a5764744465042798596a32c1414a7a5d00e00"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
