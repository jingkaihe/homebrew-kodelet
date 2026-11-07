class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.23-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.23-beta/kodelet-darwin-arm64"
      sha256 "53c5d6349876c9b369206bebaaa8dfcc3d90eae7509f81b08f4ab0099110de7d"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.23-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "2972d263319d4aee04f1f31f8e391a20f21c6f299edefb33ab70ee5ab7f12e18"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.23-beta/kodelet-darwin-amd64"
      sha256 "2ef7737ecf2221bbde78c6a0b739c786d98a79c459e045795e43017d0c356630"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.23-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "3a9c2f9e4f33b992371413b1b40ac41f813c108980517d65304e45f57f7ef6bd"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.23-beta/kodelet-linux-arm64"
      sha256 "1ee3e76a3b93f2954e2bccb3243ebc23928e9dd5064a8e29c565a942cb69f3ba"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.23-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "3de2c6c1dc96cc4ae2ecf265a2468956fa4fb8efc74735d8a3f6585ec4bbebde"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.23-beta/kodelet-linux-amd64"
      sha256 "8d1f94a80c515112aaf5c6697a9b9354ecbba021fdb9d3c88054182b241fd2e4"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.23-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "9e6068db4e42bd63324937ce117147d298ff656edf0c2f0ed264e0d44497b918"
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
