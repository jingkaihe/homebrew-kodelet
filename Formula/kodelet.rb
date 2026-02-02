class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.6.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.6.beta/kodelet-darwin-arm64"
      sha256 "af0367671fb1e74d0f0a233573aa4bd29dc1b8f0b5c258ff26641348ad96df06"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.6.beta/kodelet-darwin-amd64"
      sha256 "e24f5c3195b69c389e24e03473619939b947969715ebdaeda0e1c10bdce6a49d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.6.beta/kodelet-linux-arm64"
      sha256 "72fdbc948a7e79f2d7c0cf716081250365e9a68d10a5973aff4bff41380ccc34"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.6.beta/kodelet-linux-amd64"
      sha256 "a9d5745df023a172eb09617570a5ed526a2db83455e56302477b2e656f867727"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
