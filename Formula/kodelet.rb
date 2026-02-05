class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.17.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.17.beta/kodelet-darwin-arm64"
      sha256 "0b914ffaa9d433f36a097d16190971abb39cd3eecce865cede791b91f1753dac"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.17.beta/kodelet-darwin-amd64"
      sha256 "d8f338a724d0b5e4d6436ad8495bac6a6c7311b390a76186347805bd69c33552"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.17.beta/kodelet-linux-arm64"
      sha256 "3fa546aca9c96dc6ab15c16d2cd6581e37e7e6a4d4b5722baaa3a42019966ab5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.17.beta/kodelet-linux-amd64"
      sha256 "2e66d572f01782798846e84afe3fc67a43ede9d3015ab4496bdd754957d45445"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
