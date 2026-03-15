class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.10.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.10.beta/kodelet-darwin-arm64"
      sha256 "d77644a17ab56eb7eba081b30595b085ebf6a95a04ad9fb2f69762713d28a5f5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.10.beta/kodelet-darwin-amd64"
      sha256 "ea212c75af22cd3e5d9e5369ddab800dc36857786999e498e06b0d71b8df569a"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.10.beta/kodelet-linux-arm64"
      sha256 "ea92ae2d1d909f256219f2c49b50eeed32ed04633780b75e7537bf023c14289d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.10.beta/kodelet-linux-amd64"
      sha256 "8d2df7dfa42ecfe979a2ecd661f413d839a6a8fb42304c03cd610daf13304dd2"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
