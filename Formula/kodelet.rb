class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.19-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.19-beta/kodelet-darwin-arm64"
      sha256 "40297e1e262c4b86cb3c26a35ce8664b4cc557192ee158c286094e71a547391f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.19-beta/kodelet-darwin-amd64"
      sha256 "9a65d66505b0f421c1894695d3f089d6dcf1b1ed6bff2ef461f01a35d7d3b79b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.19-beta/kodelet-linux-arm64"
      sha256 "2112fbd28f373668e95f673760decc9e46c2dad12baf1b30977c820b40e827d8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.19-beta/kodelet-linux-amd64"
      sha256 "e7ed6f9449d11b68566367bdfdd5474b4d38cb886bc21e38565673613f99deb3"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
