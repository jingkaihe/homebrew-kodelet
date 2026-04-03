class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.24-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.24-beta/kodelet-darwin-arm64"
      sha256 "26d79d1fc76630daed4a18f09ba2dbbb4ede992ab1f0c64a0d49f4e31f8b7dea"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.24-beta/kodelet-darwin-amd64"
      sha256 "e4915cfe4f1bbc598fc4e388b53ec51b14b18b4f3f6987beb2da3e45bc098ce2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.24-beta/kodelet-linux-arm64"
      sha256 "bc7ccd1da4261ffbd917c164584ee7e857aaa2c752eb8a9695aba6a4b26dbb75"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.24-beta/kodelet-linux-amd64"
      sha256 "96b48c8a4359adebf42f6b3f4efba71009737ea217d98902261784b27d3bb867"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
