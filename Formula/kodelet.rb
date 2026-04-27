class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.48-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.48-beta/kodelet-darwin-arm64"
      sha256 "54f5b36ad1518dcd34537459a18752bf5fa387cb50e28040090345c61ee35f65"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.48-beta/kodelet-darwin-amd64"
      sha256 "70e644664dfe06cc3ee20ca4b13e39f854c39f26b47c1ceb75f62d34c05527c2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.48-beta/kodelet-linux-arm64"
      sha256 "755e533d09e3d70221687197f3c7d2ebae722c00635244b5beb981cc806fdbb4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.48-beta/kodelet-linux-amd64"
      sha256 "6db230d41ee0c1c95fecffbe696fb8e161a99c673c38c06bf9b3c7a7c75b2ef9"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
