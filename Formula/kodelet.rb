class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.12-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.12-beta/kodelet-darwin-arm64"
      sha256 "ddbccc43ab31dcc8b0c9712c21f8e492c1d135aa8d3bf028a7f85af3a9a81b73"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.12-beta/kodelet-darwin-amd64"
      sha256 "8f343248891ff03e1f1cd18fdc37ee39bb914461c93bcf3edf3282773573f552"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.12-beta/kodelet-linux-arm64"
      sha256 "0b004697aef57555d58ff2799ba7f2a7674571fc230c62359c658d99fa66b501"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.12-beta/kodelet-linux-amd64"
      sha256 "fe04280993a37bb8acf1ec62960eb6a8114ecc883541e2da370ffed6930017e3"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
