class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.29-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.29-beta/kodelet-darwin-arm64"
      sha256 "a8bc8ae7dbc94881ac8f39716322df028059ffe97f7235ba5e15acc36131ed0d"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.29-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "c28178969774454d6aac2f26d5b2d64930591dd55a1e5502d3f093819355822b"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.29-beta/kodelet-darwin-amd64"
      sha256 "65dc1fd7475c47fe8988797f66328028e6a5a4a6cd4b1fce07ea14b9ed3929ed"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.29-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "721237c356beabfc086135253b84355f5d4c165df896142a62b9390a3c762046"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.29-beta/kodelet-linux-arm64"
      sha256 "97137b4805ae342351407a2acbdfdc3a3b8dbfa57acc926af9de734dca3bd621"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.29-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "28acb550f607c088f1f704d7453c8039ccca50d518f466b201d5253041343c86"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.29-beta/kodelet-linux-amd64"
      sha256 "cd7f0f1e816f8170ea49e6c89a361601eca2b73d6d6399659e86dbc586608f52"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.29-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "068e35751edd19bd67cf69209c1efc9c3373e8f15cf6ea28c628641afeae68be"
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
