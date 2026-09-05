class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.47-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.47-beta/kodelet-darwin-arm64"
      sha256 "af357c0a98dbf787bf9d8ab24a52afee8f451645a1ef4f53561fe12ecb0e2c02"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.47-beta/kodelet-darwin-amd64"
      sha256 "86fe6d932f4b9dac74e64a3180d75965565cec79144f2db09f1e2c35185d2745"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.47-beta/kodelet-linux-arm64"
      sha256 "58751dc24f4e072b32fc1b7b1d74bf0dfb7c427305613be3873d9d34e9c0bb77"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.47-beta/kodelet-linux-amd64"
      sha256 "8b8b8a0de0eba15b2f69176a0ef5ba14f3c920b82a779a990edded606acd25f7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
