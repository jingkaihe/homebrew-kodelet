class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.26.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.26.beta/kodelet-darwin-arm64"
      sha256 "a7ef6b4ed6e07da130ed431d8c5cb88af18e295e8f41bc13d35792d877a9d486"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.26.beta/kodelet-darwin-amd64"
      sha256 "a6fe9fa56b814df3f199dd5c5b2f6d2dd0a10ecd4213d2fe30dffb6fa349ddf8"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.26.beta/kodelet-linux-arm64"
      sha256 "047a252b4d0b2da81f42966d5a0a76e89dd311e04452b18a70db09b2c32caef2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.26.beta/kodelet-linux-amd64"
      sha256 "ae71b56bde9813eb003da74fdad466c31ed795c7c036f13b0de004dd3ba8eb88"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
