class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.7.1-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.1-beta/kodelet-darwin-arm64"
      sha256 "5047d7be941ee3f26c5dd9dbfd68c1e1b9deb657b8ef3c2fc7025c23ca88a8dd"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.1-beta/kodelet-darwin-amd64"
      sha256 "cc6858f20c9829f1d8ffc23b1e4e980f0a8d204d9dde7b764b6587e74d165cff"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.1-beta/kodelet-linux-arm64"
      sha256 "763ca9a9e53db59a5e86e147934bda77986e736fa89e0ec0779474624e829aa1"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.1-beta/kodelet-linux-amd64"
      sha256 "9c4817c329c4942f84eb726cacc1a8a63c3b7523d41fae96bf8caecb11638831"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
