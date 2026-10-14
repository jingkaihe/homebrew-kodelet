class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.5-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.5-beta/kodelet-darwin-arm64"
      sha256 "51450bfa648e0cede9b7dc7311965d0631747b1c38e694836d4ebe928c00666e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.5-beta/kodelet-darwin-amd64"
      sha256 "74cc767a66038ef59e5ffde0476a240af762097346906e7f758cd5040c8e7b18"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.5-beta/kodelet-linux-arm64"
      sha256 "58e21f9e443894ed3514cf3d2d289ca1e9fffd92b2dc4bcf0de58b792daccb8f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.5-beta/kodelet-linux-amd64"
      sha256 "5eac1fa35cf813366e7aa9a018ead90f7da700ca87fef51129afb16c9efb4c01"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
