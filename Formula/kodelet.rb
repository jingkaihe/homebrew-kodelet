class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.23.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.23.beta/kodelet-darwin-arm64"
      sha256 "840de69dfb55d842d4cd801462177adf708db416fdfee68ef7cb3bcf90e3cd5c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.23.beta/kodelet-darwin-amd64"
      sha256 "4f5455f458f05e83784dea06fae98de7ecbde1083ef107bca594d129cf21c5e2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.23.beta/kodelet-linux-arm64"
      sha256 "91864cb1204897c88690fbde4ac6c32b608583620872a6833b86927f9e909091"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.23.beta/kodelet-linux-amd64"
      sha256 "e9251759c7ad32e62ab86f3179ac8a9e6908a028a1ad5a12819d4c9c2aa56236"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
