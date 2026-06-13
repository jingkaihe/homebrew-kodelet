class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.38-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.38-beta/kodelet-darwin-arm64"
      sha256 "125b431308a4d501c38e084d8d64800c3fe2e8cfbac8cac697f901c37db077e2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.38-beta/kodelet-darwin-amd64"
      sha256 "7003aa849185fa4ba491d4556d159edb824c478f07f9670e22d2d902fbb609d4"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.38-beta/kodelet-linux-arm64"
      sha256 "3716b58037b96d1a9f1b8ab42f378b678254456380df3e4a2c1cad222c249c7c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.38-beta/kodelet-linux-amd64"
      sha256 "48f8129660bd0f06ebbce16e698a0b03c433ef2d4a47423a56983e5ad74d62e5"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
