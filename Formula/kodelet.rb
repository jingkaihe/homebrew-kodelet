class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.22-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.22-beta/kodelet-darwin-arm64"
      sha256 "eea456a0950d5e9dbcf177a354cba5a9307d329522d5c208ea6ad1ce34f273e5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.22-beta/kodelet-darwin-amd64"
      sha256 "7e1f42334936c24a81b18694b0e8aab171cef75c74e459cc9d7141f5e4a80f34"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.22-beta/kodelet-linux-arm64"
      sha256 "815378eae455882ece4ee9649909cf223400e8285a244fbb6018bde48c93c50c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.22-beta/kodelet-linux-amd64"
      sha256 "9ab9a692f9f1addd150c51fe6e1a32e146d9d0a836c41c731afcb4b0c8a06358"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
