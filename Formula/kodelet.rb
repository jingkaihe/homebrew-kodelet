class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.30-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.30-beta/kodelet-darwin-arm64"
      sha256 "ad41fa7095392b0ceb5ae570f38902dcb95186bd9331df67ec41213bdd1ec04e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.30-beta/kodelet-darwin-amd64"
      sha256 "40b9905f0e52e9fd4a1ebb23c60d63f1f8fad9508ee2e1101a6c639cc82bf52c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.30-beta/kodelet-linux-arm64"
      sha256 "ee6368072ff12a7dd49f862a0bd5f306e01179cc11e8ca239f8ed59a29126eeb"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.30-beta/kodelet-linux-amd64"
      sha256 "d4f6b894eedfcb7e6a3a5b92d47dd680733e7559469ea7fad3afd9f58304c7b8"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
