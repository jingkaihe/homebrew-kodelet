class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.18.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.18.beta/kodelet-darwin-arm64"
      sha256 "c5fb0a2b6c8a4b09caa71d4080acd13123e4a037894a7b745484a36f843f780c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.18.beta/kodelet-darwin-amd64"
      sha256 "4aed1216bbb850c0fd284d3f0c6ee17717ac8ac8c6ed1dcf6c1f92758f2b489c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.18.beta/kodelet-linux-arm64"
      sha256 "7ccbe7c5c529ca2530c450b628bcd6856cd8ebbb9187ec31dcb18dfeed4e7f22"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.18.beta/kodelet-linux-amd64"
      sha256 "b8677e098ef8f70e7eaf38fa2ef70f4122e217103d447cfa214d0f72d3282ad2"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
