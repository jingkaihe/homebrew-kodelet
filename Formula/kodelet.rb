class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.37.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.37.beta/kodelet-darwin-arm64"
      sha256 "86871887209f850698918ba4a6402c17ab8a5aa50f561ffb512ef365d62219f3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.37.beta/kodelet-darwin-amd64"
      sha256 "1b5c826a90d120899f622d923a4d33102955177038113af53a0ae4a68f5f660b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.37.beta/kodelet-linux-arm64"
      sha256 "212afdf863c73efee814be245b26ab6b6d54b497bd197dda6ae2087bc347f500"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.37.beta/kodelet-linux-amd64"
      sha256 "5cd4f160f49597e791e9e641778f4d92a44075d8ca92b75d51ff85c63eba51c8"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
