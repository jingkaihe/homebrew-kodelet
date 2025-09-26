class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.0.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.0.beta/kodelet-darwin-arm64"
      sha256 "1dab5ea0fe7cbd636416494ccc586fecd4b7aca242d21e160f08eeefe71d2743"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.0.beta/kodelet-darwin-amd64"
      sha256 "390c0519a657e712fe7dddc6775fe71723f579b0fbacb3e33c73dd6555456652"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.0.beta/kodelet-linux-arm64"
      sha256 "b35167b6172f4364ccce642fdf1e8b1b685a89881bb4c7ed92b4fd074f2fb925"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.0.beta/kodelet-linux-amd64"
      sha256 "2984fa16a8e18c1c054f660b19d91e038446e15a32863ac171bd1e7a52172c2c"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
