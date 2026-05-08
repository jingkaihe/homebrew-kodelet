class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.5-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.5-beta/kodelet-darwin-arm64"
      sha256 "5f8f49f06fd36f7941467e4d4ed9a6802174d32d9efdefbcc70d340e01725025"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.5-beta/kodelet-darwin-amd64"
      sha256 "935b7a079941d48f3cfdcb5e604224846f7f1f1d018fba17b677fd62294317b9"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.5-beta/kodelet-linux-arm64"
      sha256 "235f37702b359c9b2aee167b20f5563b9fd957153efeb154a500c98b826c7456"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.5-beta/kodelet-linux-amd64"
      sha256 "074f356c6428e303ad9fae57854b1661f4d30f61abbba2529f10c6a06ce60a6b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
