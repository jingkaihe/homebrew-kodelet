class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.24-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.24-beta/kodelet-darwin-arm64"
      sha256 "1568e55f9899dd406ca48e88ca6f44b286faeb19f5bf37dde608040711c8ea4d"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.24-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "12d5972568d3990479f96387a0080edc879528729d22ceda14f9bd0dd1d10b0a"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.24-beta/kodelet-darwin-amd64"
      sha256 "c843d7c7093b12514a0da84d1c3e35a1e29ce9b76cd11f4118070ae6e9736e5d"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.24-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "1da3a59cef2587e0dccb8319432acf8dc2f39d435cdb4895e9110b866152bd17"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.24-beta/kodelet-linux-arm64"
      sha256 "dd175184d28b044dba8d7b3d6447d34d43b1276f95f2049770d9c93fd52ff178"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.24-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "27896d8f675077edf8e29ebca9e0a27c4707b614d85dd7feb2c7b7078b940292"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.24-beta/kodelet-linux-amd64"
      sha256 "8a0cfe05728f3fdf11bdc890aa439864518cc402358360eef3bcd533737451f9"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.24-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "0f01869b14bded5c3233274c8bba8dee1f8ea476eb0dff5b4409b412e68a681e"
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
