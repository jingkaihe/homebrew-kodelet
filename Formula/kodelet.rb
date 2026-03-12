class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.7.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.7.beta/kodelet-darwin-arm64"
      sha256 "ece94974af47cbf75a13732ebe61c748f4aefe75caeffa0bb7ea156f250e4b8b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.7.beta/kodelet-darwin-amd64"
      sha256 "2357af2ba75a8916e406e4a345780dac2946bf1655678983cd51412621e08975"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.7.beta/kodelet-linux-arm64"
      sha256 "bd3dcbbeeb939167c71e26bcbdc4144adfb00ffd61e1cd3029fd75cd621bdb8d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.7.beta/kodelet-linux-amd64"
      sha256 "0dc5e7ee4aa33d5bb56d147a042962fd986a9d5c5879646a493fefd7eb1c6731"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
