class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.19-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-darwin-arm64"
      sha256 "41263d4f6d0a6d88fff595e60ef848e51786202d864278e80e2e3ef93283e0ba"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-darwin-amd64"
      sha256 "11193e28140f6237f80297aa121a5489bcded514543ff7ded85a0df0e19bc95c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-linux-arm64"
      sha256 "edd5a40c0218d7ecc9179e92cd38e60a5a64d907904358445ea0db02e035cfeb"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-linux-amd64"
      sha256 "7c6ec6e6ec29e9f3376239b25880dcb4e45a44c9fad23038e18965a22b86962c"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
