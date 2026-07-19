class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.2-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.2-beta/kodelet-darwin-arm64"
      sha256 "4aaf0ae50601e5da4989d1211111dfdb858966a2b2ebd21b0615af9caef98874"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.2-beta/kodelet-darwin-amd64"
      sha256 "398fad1f1d5fd605424e1e4be8004d1c47930546f5217dacb4c169b4b0807a04"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.2-beta/kodelet-linux-arm64"
      sha256 "5a484a6d85af7f3ffd79ce274f8ccdf13e24d4f629fcec5f0fcac48e9ffd542b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.2-beta/kodelet-linux-amd64"
      sha256 "689d69600f35d17380ffcf863b4325e1ca5882767aa9e0b821046e365a4f11b8"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
