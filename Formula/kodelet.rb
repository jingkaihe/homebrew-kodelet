class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.10.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.10.beta/kodelet-darwin-arm64"
      sha256 "a0c64149ca44916ffe6c6a8ec23c9a58072114cfa4bc26e10cdca47149b11b6f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.10.beta/kodelet-darwin-amd64"
      sha256 "469c1847f1c41f1347502b9f71026f5ca1caf10d9b1f9bd452a4e92ad2180ef2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.10.beta/kodelet-linux-arm64"
      sha256 "ca324d73e1e442b2fbb8244634401750c354c20a426aab0ca48af748d28ff8b4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.10.beta/kodelet-linux-amd64"
      sha256 "6d906f8473c925c01bd6acd7905f79a3d0f1c04260e843b913698893d2d37f30"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
