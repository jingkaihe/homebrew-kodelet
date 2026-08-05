class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.24-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.24-beta/kodelet-darwin-arm64"
      sha256 "9ee3d18d75fa247fd743f8598eb272249bc9f61ce1f74ce779c46479ec88d218"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.24-beta/kodelet-darwin-amd64"
      sha256 "e1f27d5e25460cb34f5c44cf9aca6ba8931545963ca68c0308ef2f4afddcfbe6"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.24-beta/kodelet-linux-arm64"
      sha256 "be62f392717b899231fccd794c8b68509299c763c866f3dcd41cfc9760675cc3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.24-beta/kodelet-linux-amd64"
      sha256 "80f4c146c0f5817b1f839b330ceb272f05bf74c639f6ca963e22ac711706fe76"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
