class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.33.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.33.beta/kodelet-darwin-arm64"
      sha256 "ba27233a810cc7d291d68ec7fa65b41f77f776a97a1084d156d6b16e901a9060"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.33.beta/kodelet-darwin-amd64"
      sha256 "aa06d1cf4e98c7ae717b7c1885f6ab94f2be178b0a4cfe7c682b843f20934466"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.33.beta/kodelet-linux-arm64"
      sha256 "1f4f52a7986ad0cae7336bb484a166e56ae0b2a64e5a3967af042b7a158eede4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.33.beta/kodelet-linux-amd64"
      sha256 "f242d2b6ec9c463ac5d8f6fbd2c5b808cb4d1b1c3a77f6141dbf693418fcefca"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
