class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.25-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.25-beta/kodelet-darwin-arm64"
      sha256 "7e56c39ba51933a7d82c823f19ab44f12372db19b500c9574626546255f60a51"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.25-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "46602b0e9561a5661251e30b5a455182e83c9cfdf53ce2bf587a37ab93ef8c36"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.25-beta/kodelet-darwin-amd64"
      sha256 "daccfaad74f8ab8deb3fe022a2d929ddeee4c796b6a8e2913c7fc9c038b81db0"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.25-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "92f5080f3b19ff3eeb5e2332aad36ab96792871a58288bcde0a5b6a1bdb30a6b"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.25-beta/kodelet-linux-arm64"
      sha256 "4071a285f05798a21b86bce3c2168c482d185f001ef2c9c734507552f71f9e19"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.25-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "babb4738b314244d64e8d742ffd7e62967fec179b251df56b0ba95d6f406ef63"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.25-beta/kodelet-linux-amd64"
      sha256 "a3c574484c29730d64a12bb2ee249dc5456fda4781060e1c034d0c95f4b212c7"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.25-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "e7cdc638fdaf7bc96a2abd60d0ca9d3ff63dd9eb07b1f9b05d93125761a784c1"
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
