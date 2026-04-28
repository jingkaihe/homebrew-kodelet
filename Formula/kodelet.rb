class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.49-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.49-beta/kodelet-darwin-arm64"
      sha256 "c6c951e3b479b659039b0ff88841db4969f0a11e0c06a4e5b0b16acaefefc982"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.49-beta/kodelet-darwin-amd64"
      sha256 "299d32b8b0cb92c1c46665a665c7fc8edfd90bb7ab2cdbc7893c7bf2f9e65951"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.49-beta/kodelet-linux-arm64"
      sha256 "b102946024ec8fa1299caf69582c0ae7df3460de1b8b123c98e2fb5fa5c5ce1b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.49-beta/kodelet-linux-amd64"
      sha256 "0b0aadc2185aeba6b74c053b143fc642393061cc2360407c8c1cf91ecddba4a6"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
