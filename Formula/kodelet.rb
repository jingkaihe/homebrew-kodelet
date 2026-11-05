class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.21-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.21-beta/kodelet-darwin-arm64"
      sha256 "2d7d8afe6fb4236d6cb8392e27b0b2324fa46e68fb05c945beddf6059958c43b"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.21-beta/kodelet-extension-mcp-darwin-arm64"
        sha256 "37302001be09dc6e610d6fc22541a0592bbe62e77b08ce209e68b8d452a08942"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.21-beta/kodelet-darwin-amd64"
      sha256 "17862206779475f5a0cc24ed8029e41d07454d9efc801849f30bbc344f59e950"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.21-beta/kodelet-extension-mcp-darwin-amd64"
        sha256 "56d39d4af29a721d07f5ac8c4c01ec7fe782d54b2d31b59d0fc0115c29dad0b1"
      end
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.21-beta/kodelet-linux-arm64"
      sha256 "17891e6e9c81529ca9fad9567695581ac79b5ead8dc3e32166819b547869147a"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.21-beta/kodelet-extension-mcp-linux-arm64"
        sha256 "8cd6ad821f34fe40bd0adc6d4f6fe20fb8be791025525a1dc858451fb9b278b9"
      end
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.21-beta/kodelet-linux-amd64"
      sha256 "1b6191f9d42773d33f782566d908d71c4ced030a9544f8534b1c75096fc239d6"

      resource "kodelet-extension-mcp" do
        url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.21-beta/kodelet-extension-mcp-linux-amd64"
        sha256 "d66dd6c8a26d7a37797fae6699bd2bb14779a5544e1aeaffae8af5967723fb65"
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
