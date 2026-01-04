class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.31.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.31.beta/kodelet-darwin-arm64"
      sha256 "e62b39e6d4ea6e37232cece839074df766e36902ad2378004589773cca98948e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.31.beta/kodelet-darwin-amd64"
      sha256 "9d3db84e686179db54c3cb8f90e2f027d14d882ed8466f28e9c3f9aca6b739d7"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.31.beta/kodelet-linux-arm64"
      sha256 "db8571373bd6ca00b929cb3c2c0c8f7d55c8a154158082b072db12bd61ca899a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.31.beta/kodelet-linux-amd64"
      sha256 "80cd239e8ca55ca5b53cf6f532cc84e77d35e1ef04ee08fc70182ecf79cae7d2"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
