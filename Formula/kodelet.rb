class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.30-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.30-beta/kodelet-darwin-arm64"
      sha256 "1ffdf4c3d057247e369dd2b49db544c8fee404c816d50eb1aca12615b33854f1"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.30-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "f882266e055ff78daee7e0dcc20d7386b792ec226ba18c61b2580e07e5ad3ad2"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.30-beta/kodelet-darwin-amd64"
      sha256 "0e07dea7b5a0462e40c58b0f2bc7e5f4378602b1d18d0353eb4ec96de894c45b"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.30-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "f5570742ccb96070f4d8e84972e20cd972c057f34fdf11058e9ec2fe6b083cee"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.30-beta/kodelet-linux-arm64"
      sha256 "23310f556634c73e7a93a3ed5dc7bea3ce69d8d966aebb49402701824819ef83"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.30-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "9c4a0a7cacdbdf316fb8c89852d42d8188fc18ad41821f86e1ce066c5f48b1f7"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.30-beta/kodelet-linux-amd64"
      sha256 "238c0aef8b711d96b23938764e5cff20b4dff3359dfbcb7290baac761c5c2cbf"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.30-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "61bc937d06392518cd06337fa61ca29b9febf9c21f11fd671d20f32f6b0c4421"
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
