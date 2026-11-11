class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.28-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.28-beta/kodelet-darwin-arm64"
      sha256 "2921f2e07dfe56f763df59420167e4d33020de0cd183e1924cd60de74063f54e"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.28-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "3ef46f3bde6212e37592dab4a8e96cea5ba479609e8e3b32823b2fd389e422f3"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.28-beta/kodelet-darwin-amd64"
      sha256 "f4cad30591ecec1b21a2e08dcb136955a6aac0f818693f5fe21422e96a3d8164"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.28-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "0f581d0425fa43d0a1e610a7e887f75c2d606d8a9e05a28b100f9b4669c1aab2"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.28-beta/kodelet-linux-arm64"
      sha256 "f19234c38c096b900155732259ecce0a4c91ce96812484ebcf2124f529305ef0"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.28-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "2d71da3cade355b70c47ed45c4022fe72471c8aaa9c14fe855243588b932c6f9"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.28-beta/kodelet-linux-amd64"
      sha256 "e02e153efe117c6bd4b28aa3cda34e7add6e0a6719e63ae9fe70f6fe124478fa"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.28-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "3be78e4b6f2ed131cc94ce484e37175113020393fead12cadfa194d546e4b9a3"
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
