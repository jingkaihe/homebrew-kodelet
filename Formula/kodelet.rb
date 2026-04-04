class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.27-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.27-beta/kodelet-darwin-arm64"
      sha256 "1e040b3daa32f173283e497dd30d07dec4dac9b00fd6b2e54237af65843ec49d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.27-beta/kodelet-darwin-amd64"
      sha256 "88065c1a709ed451655cc508463b444aa34b03ced61a51f602f302f554f1c87b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.27-beta/kodelet-linux-arm64"
      sha256 "b4d3931f4e0734cff3007f0314a0ead795a2fd5ca3ab5b9b32a9f5f3a6fa62d2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.27-beta/kodelet-linux-amd64"
      sha256 "5e7bc7b4b679ce0975cf03cfa2e3c7967e771e73baac4bd64728f9d9a54af24d"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
