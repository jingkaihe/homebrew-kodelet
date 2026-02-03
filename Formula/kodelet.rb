class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.8.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.8.beta/kodelet-darwin-arm64"
      sha256 "12c0c3fa6833b7aa7d21596d10e89d736e75db1161639f76de5d3f899514e340"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.8.beta/kodelet-darwin-amd64"
      sha256 "d5ce7351f90e0a86003312fc81d8aabea267b3169bd44af006a3c78757d19759"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.8.beta/kodelet-linux-arm64"
      sha256 "9ce1b864a4ae4532474548905c7b8cbec91621acc207842a0bbb0e514c7197e4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.8.beta/kodelet-linux-amd64"
      sha256 "f7565e36db6fffb15d6f596d4a873fe12365eba8334e33c03e1fe743b7bb221a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
