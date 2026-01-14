class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.42.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.42.beta/kodelet-darwin-arm64"
      sha256 "7c939c35f82253dac798d0b5fb9aea7f36509be86fc859961e6a228d393b327e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.42.beta/kodelet-darwin-amd64"
      sha256 "8d1f70766a512c48d773cd74cce52e0909f1e1bd3af3d4574cbccc960ec9002c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.42.beta/kodelet-linux-arm64"
      sha256 "2e449e130ec36f93e1bd682a27ae119f3a8f5069fa1045a77572b4485d0b26ef"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.42.beta/kodelet-linux-amd64"
      sha256 "d1455b15399aff5f4034ce0c67de40f82e2a50b34688b2beb40ea1cda3f1b7f0"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
