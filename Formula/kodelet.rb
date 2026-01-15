class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.43.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.43.beta/kodelet-darwin-arm64"
      sha256 "065a49966d1e57c7cba76ab7ed1d51a30c21c4fc62b23f5133597cb500f3aa44"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.43.beta/kodelet-darwin-amd64"
      sha256 "8cb0de24605eda2efe03c929682fed52435a8cfe16fdc15b308210e98dddae61"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.43.beta/kodelet-linux-arm64"
      sha256 "1d37213bebc12eebd464de120388d51ff166ce7a16704429f25cd02d17c63727"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.43.beta/kodelet-linux-amd64"
      sha256 "c0541a4d1bd3fbfe1dbdb26f6be93c6da031f0867fb2d604dfdaf8111c6966c5"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
