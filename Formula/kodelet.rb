class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.19-beta"
  revision 1
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-darwin-arm64"
      sha256 "41263d4f6d0a6d88fff595e60ef848e51786202d864278e80e2e3ef93283e0ba"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "44f7f0d12f3c8a6970741e10851ba48a716923efc3df0235baeef59034daa93f"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-darwin-amd64"
      sha256 "11193e28140f6237f80297aa121a5489bcded514543ff7ded85a0df0e19bc95c"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "25a2cb29ad51f447bb27755470b8a22f263b8a096092070fbcc7bb6e4ea73d13"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-linux-arm64"
      sha256 "edd5a40c0218d7ecc9179e92cd38e60a5a64d907904358445ea0db02e035cfeb"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "08ad03ddae361c7bc92b0b98ff65160a25e6a7536ff8e554ef0ddbdadee01cef"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-linux-amd64"
      sha256 "7c6ec6e6ec29e9f3376239b25880dcb4e45a44c9fad23038e18965a22b86962c"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.19-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "075446ab013606694448a97b6e6d0c4106cafdfc48fa4b732cd0153849c8a491"
      end
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
    resource("kodelet-extension-mcp").stage do
      bin.install Dir["kodelet-extension-mcp-*"].first => "kodelet-extension-mcp"
    end
    chmod 0755, bin/"kodelet-extension-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
    assert_match "kodelet-extension-mcp #{version}", shell_output("#{bin}/kodelet-extension-mcp --version")
  end
end
