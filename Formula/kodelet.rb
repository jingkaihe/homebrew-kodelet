class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.10-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.10-beta/kodelet-darwin-arm64"
      sha256 "ce3e3a8f1477c044e8e9af661eb35cb227589c5716521188530774a1a2068a94"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.10-beta/kodelet-darwin-amd64"
      sha256 "e9cef54ce4865e1c001e63bb07cc21500b6a9bf4ba09e14a7bd007a0dc6ad67d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.10-beta/kodelet-linux-arm64"
      sha256 "d3c122d960d11aa0e699d9ee60b653a65ece3e851ea70570e523907edcf6e4e5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.10-beta/kodelet-linux-amd64"
      sha256 "8eb6a64704c79faceed1681c1c556f048907a2137cd1badc500851f78d6e246b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
