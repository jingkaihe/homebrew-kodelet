class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.2.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.2.beta/kodelet-darwin-arm64"
      sha256 "f2a5a32404c893c7ada2067ce4f07f6213a3a01d2459ddc619523ee96c20848b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.2.beta/kodelet-darwin-amd64"
      sha256 "e2e29bda3b2e2b039365de5a681319f81c0a3f165969a4447d6ef449458b9590"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.2.beta/kodelet-linux-arm64"
      sha256 "686a87d9ead61fae51138686abe13d369a184af3e7379e8ef4e2cca5b5538b9e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.2.beta/kodelet-linux-amd64"
      sha256 "821c0e44e640034d63d938039c0d679160f937298f7b3ab14a42a164ff702480"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
