class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.12-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.12-beta/kodelet-darwin-arm64"
      sha256 "6cb156bab144bb7771797542ab5bb5f88013d93147eadabdef3d347065d99d3e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.12-beta/kodelet-darwin-amd64"
      sha256 "d1ef671f6842df6d2620c9c942179ab3ec04bf7588d37e0d85dae2bac6cafe72"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.12-beta/kodelet-linux-arm64"
      sha256 "6621c71e41b67ac92e4a8d673c7590e13bd1d202c64934ce6a4608d4d344114e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.12-beta/kodelet-linux-amd64"
      sha256 "b24c292661d80db96c4b6ec0d89425fd4d93dbbd174569ffcc2aad6ff19aad85"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
