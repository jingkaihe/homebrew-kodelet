class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.6.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.6.beta/kodelet-darwin-arm64"
      sha256 "5a2f8f2d82917bd23fbd8904216926279e3802289022782a47c4e1595c55b623"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.6.beta/kodelet-darwin-amd64"
      sha256 "e292d723c6eb01f8c838464ce5ff5b75a1490a39bdac1c5214321ab7cfaf22c4"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.6.beta/kodelet-linux-arm64"
      sha256 "5ad2e490a3e32be21bb5614fe78df29a0e3fcb63157d4df80418f2ab7555f7a0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.6.beta/kodelet-linux-amd64"
      sha256 "0478d9890a2c2472ae4a88a72c762557a79043f981c6c65c4be01ff4740d86fe"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
