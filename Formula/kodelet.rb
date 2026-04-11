class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.33-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.33-beta/kodelet-darwin-arm64"
      sha256 "cbbffdcf57e2ca3f5871d589159388feeb696035e83d9ec4848a68065341d0d5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.33-beta/kodelet-darwin-amd64"
      sha256 "013ca09b33ffde751906faa9bd1ae7d97e6f1f2b8388c99de42342a0cecfacb1"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.33-beta/kodelet-linux-arm64"
      sha256 "ae8d4ca3f87fcc67be4204cc24a2dce69279eb168bc08835c0bfbb9ede5aad64"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.33-beta/kodelet-linux-amd64"
      sha256 "bc1d7df4ae2caa0d85c2351f460bf48c699198981a4897e5a64fe1bc9c41925e"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
