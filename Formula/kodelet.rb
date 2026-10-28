class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.16-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.16-beta/kodelet-darwin-arm64"
      sha256 "3dc7597b1dd4cf4faf0f3216b99c1d8bb127cf4076f70e05b530a78f3c47d5b8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.16-beta/kodelet-darwin-amd64"
      sha256 "2ed605ebf0dcda6ffaf2f383cfe59c1df56c1858b8f0e1c0fb197b6598955c87"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.16-beta/kodelet-linux-arm64"
      sha256 "865fc40b70ff057ccd615948011e2e110a17b77d16e59285ff5db9bbfeae17d2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.16-beta/kodelet-linux-amd64"
      sha256 "2fca6b2379c149391c6754962facbad3300e0e86e6de3167ec2927d37fa0b415"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
