class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.9.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.9.beta/kodelet-darwin-arm64"
      sha256 "209a85e559286c93c4f8edc38e71320b9b1f6ff520f55d4514f1ba64059bd6e3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.9.beta/kodelet-darwin-amd64"
      sha256 "e44341af196a67f1478a9184bad7b4a37dd21018e79ae904b4affafa6a07d0ce"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.9.beta/kodelet-linux-arm64"
      sha256 "68d3e70e48c81e70e3a5b0fac0b898604c029b129b7ac52c6e59adc4cd0392d9"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.9.beta/kodelet-linux-amd64"
      sha256 "b20f01e684c1f21680922bdd88b4c8000a468d285bdfc49adf63a1c5a1b2ef28"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
