class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "{{VERSION}}"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-darwin-arm64"
      sha256 "{{SHA256_DARWIN_ARM64}}"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-extension-mcp-darwin-arm64"
        sha256 "{{SHA256_MCP_DARWIN_ARM64}}"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-darwin-amd64"
      sha256 "{{SHA256_DARWIN_AMD64}}"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-extension-mcp-darwin-amd64"
        sha256 "{{SHA256_MCP_DARWIN_AMD64}}"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-linux-arm64"
      sha256 "{{SHA256_LINUX_ARM64}}"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-extension-mcp-linux-arm64"
        sha256 "{{SHA256_MCP_LINUX_ARM64}}"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-linux-amd64"
      sha256 "{{SHA256_LINUX_AMD64}}"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v{{VERSION}}/kodelet-extension-mcp-linux-amd64"
        sha256 "{{SHA256_MCP_LINUX_AMD64}}"
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
