class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.24.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.24.beta/kodelet-darwin-arm64"
      sha256 "c1ac5d28844442853512361ef0d5100c5c6a30ef5120beda51cf792f6a076358"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.24.beta/kodelet-darwin-amd64"
      sha256 "c04148593c10abc906495f34f155b55e2af43e5e4aa3176bd1a4fda44b88926e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.24.beta/kodelet-linux-arm64"
      sha256 "09b1f6bc3a75ab8854a14778b117c8b148bcf0ec08ebf60cf4a882ca9d4b9f85"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.24.beta/kodelet-linux-amd64"
      sha256 "0e756b44ee08e27f3ce20b48d770b5a4d6fa402eff1bed41bff79e9a109dc258"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
