class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.22-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.22-beta/kodelet-darwin-arm64"
      sha256 "3fca3e418d106c978cb75f60466f585b2c145a84e6ec2cd376e359dbf9996bd9"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.22-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "224a63d19f4ae91f176043b8e81e2269ad13329946b8991c0e41eaba3980455d"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.22-beta/kodelet-darwin-amd64"
      sha256 "fab334c14d3d4c4c16db27ef3eff27f46608c00a4a59fb8e6dea82758b587c7f"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.22-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "39bef7be6f6d07bd1fe8e7e40c907b53972d5cb09d83f0de30516eebf9bc5388"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.22-beta/kodelet-linux-arm64"
      sha256 "b8f4947ced571ffeaebee9974bdf66d9056ff69db27ceeb14af2f982cc227a09"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.22-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "b23a64823fdee88c52bced8b7fcdb0872bae42ae9df8cacda4d0f6792d50f459"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.22-beta/kodelet-linux-amd64"
      sha256 "5e091ac002366ad94b75b3896ca9960f00eb0f926412ede6c8e3b5bfa5369eff"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.22-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "a512d64621ee78972b6cee1344cfc6a385affb8a3d0fc17dbb0b960dce3bec34"
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
