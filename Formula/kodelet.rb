class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.35-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.35-beta/kodelet-darwin-arm64"
      sha256 "0ed2aff838899870236421b9f746724c5599525dbd736a3cc5eaaf6c3df19983"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.35-beta/kodelet-darwin-amd64"
      sha256 "6469fce1f6ca08e058a0d086d648fecd27ca43ef2cd4c8d5b79eb6c96eaa71df"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.35-beta/kodelet-linux-arm64"
      sha256 "003b9938f2018d83b5138cbcebe8b5a41f3f2a6688bbdddbaf2192ed0ec4caac"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.35-beta/kodelet-linux-amd64"
      sha256 "c9503f191c8a06ca59c8d5e982d2bfc245d20f6ef02a35277cb324c266758dfc"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
