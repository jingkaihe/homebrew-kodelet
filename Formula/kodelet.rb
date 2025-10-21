class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.14.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.14.beta/kodelet-darwin-arm64"
      sha256 "011e85df9b1a95dd2b7ff683cba4bd5047ccae586e0900d7643b3edd63f5dc35"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.14.beta/kodelet-darwin-amd64"
      sha256 "9a3afad8f8c27cc460d29e1b1040a08f02dbd89e8799e14ac7f45aa401a8c8ea"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.14.beta/kodelet-linux-arm64"
      sha256 "9bf788a2a20cd75424f70edf5d42a5087cdac88ea0d9ff786e684115dc723e2e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.14.beta/kodelet-linux-amd64"
      sha256 "5ca639507b1ae6d836b10a460c940d1d2e40bd2d20cedbbeec06774b7f56ee14"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
