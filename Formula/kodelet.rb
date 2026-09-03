class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.46-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.46-beta/kodelet-darwin-arm64"
      sha256 "03e4bda08da86c1cd2d4f99f8991758591e50f4dc64c6242e24700ba79db3a9b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.46-beta/kodelet-darwin-amd64"
      sha256 "2907ea44547edd7b700157e589bb388501b988c1abb55338f634950dcb1e0d69"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.46-beta/kodelet-linux-arm64"
      sha256 "135b680ed004ce9fceaf69d935f79046276da1325aafa885e276e0d7c39c0be6"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.46-beta/kodelet-linux-amd64"
      sha256 "87039fbbbe321d7d3e007caea43c6082b90721ba820506ec8b4f67406124250d"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
