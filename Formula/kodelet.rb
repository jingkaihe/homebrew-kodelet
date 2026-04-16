class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.39-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.39-beta/kodelet-darwin-arm64"
      sha256 "55a772342b4c3d5a11ac9a4172435831ef34b51713524960e9f705f8fef55e88"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.39-beta/kodelet-darwin-amd64"
      sha256 "946d59bd2d4f569758d19979a319b33fe05da33ceaf6d8fd289de430b279c3a9"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.39-beta/kodelet-linux-arm64"
      sha256 "6d0f18b48119ef2f7ee5385110dab41d14b701226e42ddd79d2e023148caf5f0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.39-beta/kodelet-linux-amd64"
      sha256 "da5fe1797719fcaa1b974178ce007ef66cf116a07991c3b0e95cbaa1ca7b8ed6"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
