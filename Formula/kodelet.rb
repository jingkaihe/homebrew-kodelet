class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.9.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.9.beta/kodelet-darwin-arm64"
      sha256 "106196950f6e3564192e843da00f3d2785c430255e1a7cf397081cbfd42d51c3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.9.beta/kodelet-darwin-amd64"
      sha256 "002bcfe4e29958e583e98df19331d9142f8890afc9a6ca0992d13dff24cb5989"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.9.beta/kodelet-linux-arm64"
      sha256 "b0edff7cfdf2d879b354bfe4a370d44383bab02c912e71643c83123361be47c9"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.9.beta/kodelet-linux-amd64"
      sha256 "3a5e2051ecf4a578ac7cd47a737d50d9198b725e00ba53645300c64ad71a8915"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
