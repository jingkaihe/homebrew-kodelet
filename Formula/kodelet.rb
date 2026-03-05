class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.0.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.0.beta/kodelet-darwin-arm64"
      sha256 "f61156db08b4810fb5fb4041f21076fe3798a5a39c75b985e05d4236545565e6"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.0.beta/kodelet-darwin-amd64"
      sha256 "e3d2cf862ef79a91351f7cbb3c47aa21870989d7f6f8eba96fde8e614ed5817e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.0.beta/kodelet-linux-arm64"
      sha256 "9e1d3f75e62f8b9fcfcf4d5fed2a453fd1f8c862aa0dce202f31a32f80531d7c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.0.beta/kodelet-linux-amd64"
      sha256 "6947fc3e17381a91b7673dda790dfd195d9f7cc6e7a323df0a07ce3b63f31db3"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
