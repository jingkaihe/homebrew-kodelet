class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.21-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.21-beta/kodelet-darwin-arm64"
      sha256 "788b106f791160ff6fcf0ead59895bbca763648e622d70f6997a10dc0b4bc555"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.21-beta/kodelet-darwin-amd64"
      sha256 "8216c6562bdc613462c3ad7fe6d3733d8b001558d00c6bc753ebf6ed09fc6aad"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.21-beta/kodelet-linux-arm64"
      sha256 "d18462fdd525e4ce915db204bbfa3ec15459927223eb556d729028b71daf19cd"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.21-beta/kodelet-linux-amd64"
      sha256 "e216e2abbad14b0621afcc5280d51dec4d1bf1e4bebb8a817f87e8d2376ff84d"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
