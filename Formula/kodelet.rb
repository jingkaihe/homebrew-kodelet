class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.32-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.32-beta/kodelet-darwin-arm64"
      sha256 "35ecf1c5bcf00dbd6e178103b1902d6f05a27333cbf0f324bfa7b9047b9bed95"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.32-beta/kodelet-darwin-amd64"
      sha256 "f4931e40297a373df97227b906453e1646c6a5014032ff2872c1ec565b4405e1"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.32-beta/kodelet-linux-arm64"
      sha256 "d5775f884551d8c490f0d3d95595ad2f17a8839466cf507f870dea5564360b58"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.32-beta/kodelet-linux-amd64"
      sha256 "12e0333d2ac35078158df9df22233aa64968bf6960526aececf04eb29f527dbf"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
