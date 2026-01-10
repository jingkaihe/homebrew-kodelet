class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.40.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.40.beta/kodelet-darwin-arm64"
      sha256 "8a4e68dc179670665ab0978a6a094fd3064d63fd286d0a996deb0b3d15018103"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.40.beta/kodelet-darwin-amd64"
      sha256 "73a5d283e00e753d65e6f4a9cf0a1fff8feefb012441523670509f9c76779e3c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.40.beta/kodelet-linux-arm64"
      sha256 "9634a66a49579564ca4af1d906ee7fa281d261862f1afefc0dbaee74225fe864"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.40.beta/kodelet-linux-amd64"
      sha256 "105caed0d3d9829ab3ddcf07e4fff3adf04197020a7d76ce76b0b685a3b5c97f"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
