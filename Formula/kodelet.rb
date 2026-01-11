class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.41.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.41.beta/kodelet-darwin-arm64"
      sha256 "af4a3bd5f0ea09c8f00b1604a5ce1af199dfa780d7062cbc6d32d13461e7958c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.41.beta/kodelet-darwin-amd64"
      sha256 "101e19bfcda68718b15c9fa0a02d10554b39a5e71ad0a1f9d83e1304313c83be"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.41.beta/kodelet-linux-arm64"
      sha256 "58bdd8f7b0cbe4f1daa71af348cf01e40cc847d50c34a3276f9dfa3bf874e639"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.41.beta/kodelet-linux-amd64"
      sha256 "0b6a2567be3e42994edeb1365e0b35381e1a70b6f593a4a4fdf4c8c6d0841a7b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
