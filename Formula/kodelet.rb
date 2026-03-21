class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.16-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.16-beta/kodelet-darwin-arm64"
      sha256 "c899aa1ff1f202eba64ce815f36083a5cf35d916a0eb1a4784fd01a32f33c571"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.16-beta/kodelet-darwin-amd64"
      sha256 "750c85bf9243fffe86afcd75bdb1e13158d38a35569cdaa5058d595ceb697354"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.16-beta/kodelet-linux-arm64"
      sha256 "c1adfdf52389d25d45563437964af285b3f47bbb32b35a6880ce58f881c180e3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.16-beta/kodelet-linux-amd64"
      sha256 "3ba601f064b4b4a22564e7e6992a4ee568c514b96c84bc1b1b19222f0c28d94c"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
