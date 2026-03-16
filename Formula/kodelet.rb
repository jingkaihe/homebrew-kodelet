class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.12-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.12-beta/kodelet-darwin-arm64"
      sha256 "acab9fecbc36587f3cdd3b64bf2ac6b03e70bacda8c8a29dc87afba7b27cbcf8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.12-beta/kodelet-darwin-amd64"
      sha256 "4035c4f5579f92f880c9d9758c99d9e9818cfccf861783e0b44098b648e4019f"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.12-beta/kodelet-linux-arm64"
      sha256 "f26bfbe207ded359fdb0dfae16a50383f6b48b40afa98690cba78055ed4ed6ae"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.12-beta/kodelet-linux-amd64"
      sha256 "1ff404baae671053525fe668912b50e630fa206d6763a38a46167fcb36960341"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
