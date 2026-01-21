class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.45.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.45.beta/kodelet-darwin-arm64"
      sha256 "6e364beb65478aec75732f04e7547bd92dbeef10f59c17e8b07447e8a96488fe"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.45.beta/kodelet-darwin-amd64"
      sha256 "7966c9dcdd6dd02f0b4010b79dc01b5b783d58046260bf45e80c55b3abc635dd"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.45.beta/kodelet-linux-arm64"
      sha256 "f13e663c7338f391a59f1001b7cafd2e77bb600794b474df0e8cdf8f11f96b59"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.45.beta/kodelet-linux-amd64"
      sha256 "9e660cce5b31196faded78fe2f4bf92ec77d50ef2c9b7b1a13d9ee06306e677f"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
