class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.44-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.44-beta/kodelet-darwin-arm64"
      sha256 "8005a25d4658c0eb8c30a6e8c4ff4e8383e2611fd000bc32034302211b8bc3dd"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.44-beta/kodelet-darwin-amd64"
      sha256 "4715522eaad0415944295e6452ac64859f8a6b42e52230dc4138a2e945f69a1d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.44-beta/kodelet-linux-arm64"
      sha256 "621cc99a788b6b86234bd9415284de54fc347d973975e2cc97398b54541537d0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.44-beta/kodelet-linux-amd64"
      sha256 "7b49826037a8c530e963187c65952fadff5238af988274b8512648130ec70e77"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
