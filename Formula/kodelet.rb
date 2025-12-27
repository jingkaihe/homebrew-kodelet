class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.28.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.28.beta/kodelet-darwin-arm64"
      sha256 "820569852ed26466869e227fd35dbfe8cd12556f35829896099a0616d2812df3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.28.beta/kodelet-darwin-amd64"
      sha256 "5e9c9ca581c10f47c1e2f1b435eb249dab375430a17db8a44a69144a2c13a76b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.28.beta/kodelet-linux-arm64"
      sha256 "f8dcfdf3e1a7ae13c2804785dc20875c6e88635ab226f99fd602d6f278ca9d29"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.28.beta/kodelet-linux-amd64"
      sha256 "2a8bf50b6fe7604aa1ebebf65feb56c81f8252e7afc5c0a2cd93c30034d318dd"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
