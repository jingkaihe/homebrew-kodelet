class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.26-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.26-beta/kodelet-darwin-arm64"
      sha256 "4e39648efaa9f5b7a06ffdbadbe632df0ad57bb3d90e0534958a41d33ef7b2f9"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.26-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "76788eec12cdfe7bfef13f98909dcbe83ea88002cfa1058a5ccbd27d495df555"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.26-beta/kodelet-darwin-amd64"
      sha256 "79c437f9926f5bbc90e8137d4969880c7e504b43800ae551209e5f106c3410a2"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.26-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "6c576138317cbd88396b26f1f9d30dba7e3eb0b5837113fb6f2aa12691df90f2"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.26-beta/kodelet-linux-arm64"
      sha256 "b94de7dc29b230e7fdb3db5e36368c48d450162469f02cb54c5fd6865e2d4291"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.26-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "e702891f5e28aa03a8ea23790d5e74031405fdd0b7ac16e54b8532bdf40e6d78"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.26-beta/kodelet-linux-amd64"
      sha256 "d01789a1ec262707124eec07f69244e21a5fc1d1b0309835a5fd380299ce92b9"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.26-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "0d97a62ad0bcfaf3ee5b8486e9af000fabb76ce349da894a75eff5dc84fc29d5"
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
