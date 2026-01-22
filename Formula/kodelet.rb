class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.46.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.46.beta/kodelet-darwin-arm64"
      sha256 "616ae59671d18ed245bfc7807a86d24672d67de59f8f270952983580f1724217"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.46.beta/kodelet-darwin-amd64"
      sha256 "df14505bf5ce1a36e2e6bee29cda30f63bb2d2342f4961a23f5e63af0d270d06"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.46.beta/kodelet-linux-arm64"
      sha256 "45b30a0a133a27531c1402cee07208225e4fc7d98bd29613f62b69b3f9f70104"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.46.beta/kodelet-linux-amd64"
      sha256 "432cebda8a35f266524de582e25ed76e9901d00db1fe7bd4a6a4ccfbe3b7174c"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
