class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.8.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.8.beta/kodelet-darwin-arm64"
      sha256 "de19a6307b44e4dc9395b01efbdc747840e06551166459bb0fe0abdc2cacd484"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.8.beta/kodelet-darwin-amd64"
      sha256 "e49aa9d3753eb3252938c1e781e52a59d7de622eec0af610167d14b23eb98da0"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.8.beta/kodelet-linux-arm64"
      sha256 "3614b00c868b07358eb5f3bcaf08552196442a9e5e95b6e118652cc2d4c0c291"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.8.beta/kodelet-linux-amd64"
      sha256 "edfc38a78138aff6ae22e2540106fc30f785d10c5cf0ca2991ed2d9007a81d72"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
