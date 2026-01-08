class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.34.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.34.beta/kodelet-darwin-arm64"
      sha256 "f7aa364a6b6562313a679541bf46d8c57a7a582e9eeeb1f060c24728d7f274c3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.34.beta/kodelet-darwin-amd64"
      sha256 "a89164321f1f3efef081437d852fdd43d34b5c05de12d5731d3abeba3e5c1221"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.34.beta/kodelet-linux-arm64"
      sha256 "d2b9546fe1d40d7caf67dd0ed247a786e39750a39fa4b4a6e074b7e2c21f847c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.34.beta/kodelet-linux-amd64"
      sha256 "9470faf408f14ee3d5a7e07d86c35c5d573577aab1f89990abd36109edddf803"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
