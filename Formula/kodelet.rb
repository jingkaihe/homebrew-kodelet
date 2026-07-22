class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.3-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.3-beta/kodelet-darwin-arm64"
      sha256 "85efb5dec98f4b13833778acb66e1228e8aa4712e280a3b34567b96013d23310"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.3-beta/kodelet-darwin-amd64"
      sha256 "169c91ebde04e4494346907f8a98f2381cf13a0a0eec2d00f17901377c136b48"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.3-beta/kodelet-linux-arm64"
      sha256 "4e5676d46ee77ee89c1e66f9df54d3b0ebfeba2dc5f7773ecdef5e6758b8ec92"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.3-beta/kodelet-linux-amd64"
      sha256 "dde07547633ff29944f83edd106f32c4281b00a926f5eea89ca25952172d49f9"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
