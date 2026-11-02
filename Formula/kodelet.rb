class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.20-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.20-beta/kodelet-darwin-arm64"
      sha256 "8a06c6d6b2b5ec94bffd8024e72f92dd60fcd729ff8e23a4141ed2fda4ad7469"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.20-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "38bc559bb609fd6963c5e124c0afe55efb71648ea8d6f617ae359916d206119e"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.20-beta/kodelet-darwin-amd64"
      sha256 "3921c9a47a375c01e7fc319aa9d4e6744006a1447fd1f2a4475ce9f308afd6c7"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.20-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "cb27d6f681e4e2540dea9c2d79020d9e1d314b6664053e002a07466773434221"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.20-beta/kodelet-linux-arm64"
      sha256 "423c0213507fadce61f49d1b31e9cf76060136cb2b60bb0873e5b888bf19b6b4"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.20-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "dd9051c46c296d2513c5a673aec276e8d9c70a9af5875cf2dc4024d2e4979615"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.20-beta/kodelet-linux-amd64"
      sha256 "4360f9f32c460fbe02761618c16b66e76f56a385196623f2d82f315613961506"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.20-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "43f20faf8182d5590ba191c1aac0f65d6d5df4bc52e82cc63f99d9cb5b38bb94"
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
