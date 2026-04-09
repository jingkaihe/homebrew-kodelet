class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.31-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.31-beta/kodelet-darwin-arm64"
      sha256 "7e8f79a648942a6a6848b6f37b7261282a78abafed1884d731c7b52ab44f6e96"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.31-beta/kodelet-darwin-amd64"
      sha256 "2ad79890622bd0293c5ee6c0630bee035b739e485114df95af730d8f8233970d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.31-beta/kodelet-linux-arm64"
      sha256 "278179dfe9da8b63a550a5c348e6a5c52bd27c526c819b0f2361c69a16d5f3ef"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.31-beta/kodelet-linux-amd64"
      sha256 "2276ca7d824273e14663cdd80715f2100071f783e0d72623c7f221c1f1a49597"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
