class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.22.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.22.beta/kodelet-darwin-arm64"
      sha256 "7c731461cc603b127cb8ddd31a4c67f3b73963cdec44b8a08d7d95dccd8e3107"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.22.beta/kodelet-darwin-amd64"
      sha256 "38a395ce10f4e47f669acff5f4fd43881550169b2c15c24b25d922eba71dced2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.22.beta/kodelet-linux-arm64"
      sha256 "3d626e012ea8c3f22c5efe6f1a64bf249b023f4cec226fd40869272e24d71bf2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.22.beta/kodelet-linux-amd64"
      sha256 "a055bc0e31a2d0cb5a9ab90dd965835b339ece8618a0668d7163c72ceb88d7d6"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
