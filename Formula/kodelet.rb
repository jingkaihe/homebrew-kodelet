class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.32.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.32.beta/kodelet-darwin-arm64"
      sha256 "af6ca2d2c2dd7992c510931c0bedf1cfbdb84990f13e3f48eba9cc1f136f5523"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.32.beta/kodelet-darwin-amd64"
      sha256 "beb6ed12b137519d1970592377112a5920e1ac6c99fc41b692ecb85b1cbd87a1"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.32.beta/kodelet-linux-arm64"
      sha256 "e9878ecdd22a35a45fba1dc7376f6edcad0915983b764adf1454b65998d9c77a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.32.beta/kodelet-linux-amd64"
      sha256 "0c21f82e2f9bc015693b1ed878e4325d34eee7aa4e33534d296a33841dc70427"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
