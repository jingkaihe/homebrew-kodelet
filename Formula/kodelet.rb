class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.42-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.42-beta/kodelet-darwin-arm64"
      sha256 "88eb623b1ef88b39b88411fc09187dc4c6a9df765899443a09803331c82d1c66"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.42-beta/kodelet-darwin-amd64"
      sha256 "667ba9794304ef2fd075674ab36928fca5326c347f64f7c9413bd90eacbbd4a9"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.42-beta/kodelet-linux-arm64"
      sha256 "c407b3fb209771c7e4e5e61a9939bbaf115be37d7b9d540b67b9208ebf6cc1d3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.42-beta/kodelet-linux-amd64"
      sha256 "8750f8259caf090f5e68aa8185647c6c9becdfdbc43669a91aee2e3e087e7f04"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
