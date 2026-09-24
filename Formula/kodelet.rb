class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.22-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.22-beta/kodelet-darwin-arm64"
      sha256 "b4c0052c0083f13268eb898141c2eb6447337a0a13c813e0c38f0b14dab98be4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.22-beta/kodelet-darwin-amd64"
      sha256 "7620535d2c0abdd4f3c56ace39e71db72f54edf71e8623e144f14369845bdb98"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.22-beta/kodelet-linux-arm64"
      sha256 "0f683bcc60d7173bf06d6389bc5b2fcdbd1709ea3973410e8c465feaa4f3e548"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.22-beta/kodelet-linux-amd64"
      sha256 "19e9670d03827b0ac747c8d6d33624a74d42d70fbc966b7a22343c26b83fe3ad"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
