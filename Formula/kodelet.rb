class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.51-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.51-beta/kodelet-darwin-arm64"
      sha256 "a6ec738757048deacdb707de2a09f8ef3022b2deff6a1bd9a676d1478e52e7b8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.51-beta/kodelet-darwin-amd64"
      sha256 "ca375b74f88b63711e9e24ac6d350a4110d1f94760aa9382ba50e8ac81fc6257"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.51-beta/kodelet-linux-arm64"
      sha256 "438b7d41229ecdca257e2e6a2dc9bd67cc8815acf0c0ed50d182c0ce2e8b85fe"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.51-beta/kodelet-linux-amd64"
      sha256 "c12037abad4b0914388cc2e358de8c19e56340d92239c48a08459a4ce83d4fc7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
