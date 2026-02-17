class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.22.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.22.beta/kodelet-darwin-arm64"
      sha256 "86f2b854a56a6dd90cf40514a4efbe16bf9c283ea407526f303c6ec95d025f65"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.22.beta/kodelet-darwin-amd64"
      sha256 "e1e8017fe3ab129497501886e7525c428b6151d85670324920baf1acd3f3d34c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.22.beta/kodelet-linux-arm64"
      sha256 "85a05f9bc273d7528bccdb6e216aad9345dcd82e51503c583a3a31e71986f42c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.22.beta/kodelet-linux-amd64"
      sha256 "937c834ef4dea4664911303e8774f092c49dceb3620353fb079487807b40963f"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
