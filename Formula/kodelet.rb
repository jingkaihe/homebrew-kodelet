class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.43-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.43-beta/kodelet-darwin-arm64"
      sha256 "639c431af204716dcca44da20e549ad7a81312d6374f2fd7cca391dfc7aac63b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.43-beta/kodelet-darwin-amd64"
      sha256 "84678a0490d251dca7e065c510bb8d19db9fa85109a61daa789415d9bac2bf79"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.43-beta/kodelet-linux-arm64"
      sha256 "e64fc3b3f1392234b5a69e9a5e9bea96ce2ca59c77e7b66a866920f40b11a288"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.43-beta/kodelet-linux-amd64"
      sha256 "2d26ec50b4f327e14f9b25b6441004d0edb1cdf781ffa0e7c76b7587b39b4546"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
