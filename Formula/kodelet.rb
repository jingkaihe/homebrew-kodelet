class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.43-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.43-beta/kodelet-darwin-arm64"
      sha256 "b739c2aa5f244454f29f9e82ea4ebaaba82cf8181ccd4433014e8c2da764d5b2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.43-beta/kodelet-darwin-amd64"
      sha256 "2388b86c8291815f625c1dd1d05f8e74db2e0e5acbe5491eabec21976356a554"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.43-beta/kodelet-linux-arm64"
      sha256 "4f32bf58dacd1e0bb1edaa0d3ce9b9977dfde49d13dafe2f6cf4b8ed26f60210"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.43-beta/kodelet-linux-amd64"
      sha256 "2edf8a8d8cb05ddd5b6991f74bb3de961ad15d9dbb334c050cce699fcb89e702"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
