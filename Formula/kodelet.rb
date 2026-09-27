class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.24-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.24-beta/kodelet-darwin-arm64"
      sha256 "7d6b025ad66eb1de4144b9f24013db2173ea4976de1643c1afeaa78b3acbf085"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.24-beta/kodelet-darwin-amd64"
      sha256 "ff53338bb442d8f99160c4941821b3b8d271a0d20534d53193ce2bd3aea8af1f"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.24-beta/kodelet-linux-arm64"
      sha256 "5b6c7b7f187d0642426f0f00433643540228ede3d82d6135de0bc3d598157bde"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.24-beta/kodelet-linux-amd64"
      sha256 "1b594a1822e26230541503ddd34c2ab81f2c837171c11df76cb229bfeb897cc2"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
