class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.37-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.37-beta/kodelet-darwin-arm64"
      sha256 "c19e043e97f72bc4fda61089f8f6c23d266066d6bb070c97bb1c15df7421fc4b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.37-beta/kodelet-darwin-amd64"
      sha256 "715fb03de3189d6dc6599a78117fe8832ddc60a8776650268b750a572c457dd9"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.37-beta/kodelet-linux-arm64"
      sha256 "b6c7c77499dfe213a156a6df7cfb929ac015492cd86a0b1e6e8074df3ec095ad"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.37-beta/kodelet-linux-amd64"
      sha256 "089b2dd60eddc5ecf5f1434c89f88c9fe52b4977ba2a7dbe8209ac9232f3d931"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
