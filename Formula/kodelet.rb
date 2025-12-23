class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.25.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.25.beta/kodelet-darwin-arm64"
      sha256 "dc45cdc04a0c15f510d3e88d1c07c4390957da26f579d0b08114f6f231bf9a0a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.25.beta/kodelet-darwin-amd64"
      sha256 "27c8ba61d4386f90f75f82ee881e360912b0e76c7a68d2042f061c7ece7a7e6b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.25.beta/kodelet-linux-arm64"
      sha256 "43a7ba808d4314fa4f2a061a71587fd802480ce2c01de98e3ed927f27e4b695c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.25.beta/kodelet-linux-amd64"
      sha256 "af55b77f0b40378a0a154e739bb6d5a87e1271104c15b7d8ff2baa0dbc83a28d"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
