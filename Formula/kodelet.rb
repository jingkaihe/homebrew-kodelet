class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.11.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.11.beta/kodelet-darwin-arm64"
      sha256 "eaf09027ab5e0fada5c1f6aa2846ab28fe7e152fd4d108b2bb1a32bbc38740d9"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.11.beta/kodelet-darwin-amd64"
      sha256 "85c4bb09010bb48e205ca55a28425905f7aeab3cbd086f685870be1439060f3c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.11.beta/kodelet-linux-arm64"
      sha256 "f304112ecad6f0659ab0ba909ce2009762b6dc3a3f4570d84c8669420f957290"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.11.beta/kodelet-linux-amd64"
      sha256 "cec95353340179227876d3c45e22ffaab6596d34e9968e961fbf03621aa6dbbf"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
