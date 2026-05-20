class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.14-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.14-beta/kodelet-darwin-arm64"
      sha256 "cee50507899407873133cbce2c3d9c418037866c79d9810e9eb21b41af1e137d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.14-beta/kodelet-darwin-amd64"
      sha256 "a06bee33c5f18f8fd0a9535027d7ef3bfc77390ee4e9dae70e5bb1f7c4dba442"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.14-beta/kodelet-linux-arm64"
      sha256 "287afa2ed2c8ad42389531fece4a2fbaea2817e200311b94a38deba1dc3e2ae2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.14-beta/kodelet-linux-amd64"
      sha256 "7c59bb4f798ce164fa236478f75ea48218cea1fcb83ad8ea42327140a2afdcb9"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
