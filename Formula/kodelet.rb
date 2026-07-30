class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.15-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.15-beta/kodelet-darwin-arm64"
      sha256 "51187242e575eb381472d8db699ca5c864a56aa7aa740ee79e0e5e9c0044ad81"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.15-beta/kodelet-darwin-amd64"
      sha256 "4290e3be71c420558805eca88821def154df56ab06f72807c95a71b6b0143687"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.15-beta/kodelet-linux-arm64"
      sha256 "dc72d2a16d85627a1ee694f8c3267a9c252582f19241c2d5045c67cae0a5214a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.15-beta/kodelet-linux-amd64"
      sha256 "26fd003a7c9ba075127534807c5cb27aa53240d28f150ed6165ed4be90d765b7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
