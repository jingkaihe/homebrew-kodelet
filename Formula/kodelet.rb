class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.41-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.41-beta/kodelet-darwin-arm64"
      sha256 "093baf8a15b0de244435d2258f3b35bd049a0d1d3ff6dba5b3e2a28759faf57a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.41-beta/kodelet-darwin-amd64"
      sha256 "9dcb390ec938778720280d04ac68b33fd8c0452e899d7475e478a4e4a83dcfdc"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.41-beta/kodelet-linux-arm64"
      sha256 "3194b4b0b4b83b045701b99f92f11d7dcc39963fccd3b94952185de20ac7ba2d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.41-beta/kodelet-linux-amd64"
      sha256 "2eeee8bad42a07e99a62c9a04710281f9b5ee6c10d83fe24134541963cf39e81"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
