class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.10.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.10.beta/kodelet-darwin-arm64"
      sha256 "eb2d2fa5d3ffab855ea81e7435eea73916ad0e97f751a85ee2be3bbc1763fe78"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.10.beta/kodelet-darwin-amd64"
      sha256 "f4845d01df32ce60af7be9c4a74404bcef150eba5f7e0b07b16e4de4658b1b58"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.10.beta/kodelet-linux-arm64"
      sha256 "75a7949cb34b8a3ec3a42dd2c4ee45e54d7c118d8ec27d57575b01763289909c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.10.beta/kodelet-linux-amd64"
      sha256 "ab09072376a676c3e7a14622013c631d26edb63284db0f1ccf8bdd9ef87e63d5"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
