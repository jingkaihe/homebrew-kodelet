class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.19.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.19.beta/kodelet-darwin-arm64"
      sha256 "fc8df90d58473c33ebb893f4b944408a591e521c39f092283c038dfc4d22019a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.19.beta/kodelet-darwin-amd64"
      sha256 "a50963e3f0dd6b2fa71740bc0c22934d390861539a6602c59296f959d7cedcc4"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.19.beta/kodelet-linux-arm64"
      sha256 "4638f880173f0f65b78a3bce50e2203cd76642a61ec4ee2fdfccb357e782d65d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.19.beta/kodelet-linux-amd64"
      sha256 "27c16390f104f4366cb0caa8f24e55011a5d59c90a4fd495941570ff3bb3ee66"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
