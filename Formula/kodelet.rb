class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.18-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.18-beta/kodelet-darwin-arm64"
      sha256 "2dc1117a59b3fff73debb6f1832c1660bb558d888f9b220fc8d8876998e758d0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.18-beta/kodelet-darwin-amd64"
      sha256 "ab983110229920041ecc135aae202fab020d9f4f9aa2149a475d0434d9aea432"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.18-beta/kodelet-linux-arm64"
      sha256 "8f9fab606bf29ab4ef8b617daf3300ee315ecd05515fc87444ab940140824036"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.18-beta/kodelet-linux-amd64"
      sha256 "491e4f4038857dad31ba944bf7b6ea5769b8ae4dcded90c90b174aacfe681678"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
