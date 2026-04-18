class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.40-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.40-beta/kodelet-darwin-arm64"
      sha256 "dbbf20288f0b90ff15240852eda790576f74d3b668b2f4f5e182ac5383b727d1"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.40-beta/kodelet-darwin-amd64"
      sha256 "e06891cddd9a699e95305af20ab4dafdf2ef5358e5b135d8cfec743c376a1ae2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.40-beta/kodelet-linux-arm64"
      sha256 "5605d54d77bed14ca016e98332f274f2e6dbf7ccdd7c81d83ec274f382d67fc3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.40-beta/kodelet-linux-amd64"
      sha256 "78280d87080881ba5d27735bfffb90e1f063bc0d44890edb45c5c6c4f1c022c7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
