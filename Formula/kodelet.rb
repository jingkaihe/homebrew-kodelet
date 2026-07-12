class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.56-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.56-beta/kodelet-darwin-arm64"
      sha256 "897044421f3240b099cd5af11cac587552cdd1a325b5500ecdeb8d72c5df59c8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.56-beta/kodelet-darwin-amd64"
      sha256 "4172614df7ddeaae8faec995fdf33ba4ac4396740ee72d090781f71da3c526a3"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.56-beta/kodelet-linux-arm64"
      sha256 "e28ebe18a0b5abf74b79daca15160ffbf30c7cd6cf816917fb712dfd1c46c31d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.56-beta/kodelet-linux-amd64"
      sha256 "ffad74967ef9b69fa14b151c49310e1aab6a913b5f8d4dfc0697aa69edb2d27a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
