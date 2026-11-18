class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.31-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.31-beta/kodelet-darwin-arm64"
      sha256 "9068d94757626944e4c6fa0425bffc0ca5c2b36814c9a20ac3cb612191439235"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.31-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "25a06b4630dd7ce41a272cae509d6e7da096f6c5fe6ab69861393d413b4ce42f"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.31-beta/kodelet-darwin-amd64"
      sha256 "edaf7d91e6f5610e3b3160894f24733a3637440dc58eb76b7888d29476a3a7e7"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.31-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "c016b6ba75197e2f608987662ccb99db1d6b2cd357ba96a97ba26a43516ec9f5"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.31-beta/kodelet-linux-arm64"
      sha256 "123e6ecb2172d9cdd135c4dc450033f73be385010bff00e1b21c40cb5c221336"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.31-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "b169a12b930449d3ecfcc5200b05f07be0403c1fb05abe65b0b7e5c74694b7e9"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.31-beta/kodelet-linux-amd64"
      sha256 "29f83725680bfbff606030084025c65b5547ad53dc2197423673e180b5cfbf3c"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.31-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "8f3d52eb709d75e8ffad4aed153da79bfe069f039b478e8774dc93444a8890b3"
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
