class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.4-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.4-beta/kodelet-darwin-arm64"
      sha256 "f8efdcb9d239775eca52a2cf6516b936ed7ab73cf262aabbf433da4bc94285c2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.4-beta/kodelet-darwin-amd64"
      sha256 "7239c4428908445d8179a6e2e717284e2af38c74e19ebdbec82e1e7a26612f2d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.4-beta/kodelet-linux-arm64"
      sha256 "4892065a28dd2a16448aed2aaca39fad66d359446ce81fccb0df0fca40dd5c75"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.4-beta/kodelet-linux-amd64"
      sha256 "4f794869598509b251a2fd2bc971d4f23333ebd653069c9b913a7c0fcc1e61e7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
