class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.2-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.2-beta/kodelet-darwin-arm64"
      sha256 "936d4d6b3a5e2e2372d4821e920ba681e1853381fdf4c94443d305849f56739f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.2-beta/kodelet-darwin-amd64"
      sha256 "4c58e21841814693d2d62df6dcfd23f963fc725aa209067026c007e440e1caea"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.2-beta/kodelet-linux-arm64"
      sha256 "ca461b2b62eb5c4f97bf0c4cebab3b97d482c9fcec79249079699129f4da2ab9"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.2-beta/kodelet-linux-amd64"
      sha256 "fc0d89498917bcc0e63349e7d080e3863c3a0d202b8fbc5d65e9c070bf5f7263"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
