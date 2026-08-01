class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.17-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.17-beta/kodelet-darwin-arm64"
      sha256 "e38e7b3c6ad76f71d5b3423b953405194a86e6dab79f4cbb0a8f70eb7e96ea0d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.17-beta/kodelet-darwin-amd64"
      sha256 "e0d29bf6626e6f4b4e76200f79b3e0ba58f2df76e6d69204f1b6b192cedf6eaf"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.17-beta/kodelet-linux-arm64"
      sha256 "81caa3f945193f218b9c16496001ae5b3115c8f69ab31d7b7ae4bd9347429209"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.17-beta/kodelet-linux-amd64"
      sha256 "cce04bca08029d1fdb0c701e3957e06a704fbd4aab19191ef30f38b082dabb4e"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
