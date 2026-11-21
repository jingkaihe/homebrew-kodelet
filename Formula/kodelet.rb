class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.32-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.32-beta/kodelet-darwin-arm64"
      sha256 "b1470c04f451ff08ae9c0b3f214c4d97e5811208e46868eede181372b81ac76b"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.32-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "c53ae9b4d7cb744e15bb65b66044757e2169d30a9e5053411c8b670854dcc01d"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.32-beta/kodelet-darwin-amd64"
      sha256 "1e1dc7a71fb4032f0df5b8a4bd3f2e90632c8035b8cf68b6e1dece2e43fbc63b"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.32-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "8a02f3a15646bd6d8549273befa42c635649a8689d4903e4946c700e2534b5b1"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.32-beta/kodelet-linux-arm64"
      sha256 "3bfd990bf3886b95f3eda8b33428b0c2c69fdf67dc2650cc7a4eda66a08d68cd"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.32-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "c17df91aabfd22b13f4121db800a9f829a93ea9e2d3d0b450f5a285e13cd9931"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.32-beta/kodelet-linux-amd64"
      sha256 "2b530d15891bc5cefee5a3e5ae1730c8f5a2043f308a5fba3c75b908270a3c21"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.32-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "20fd7ca3d1b14bfb914696c1bc48a41c9af020ecbee4557e188811eca020f499"
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
