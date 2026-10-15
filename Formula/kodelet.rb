class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.6-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.6-beta/kodelet-darwin-arm64"
      sha256 "f02abcf7b7a49c865a75c015fa0bac2d9ac849a3fe12f50c0efc53671cd9dc3f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.6-beta/kodelet-darwin-amd64"
      sha256 "a68e6e935ca28818b8dfa1701437f07c7f7fff9b1c25f67dc720a97ec4daa606"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.6-beta/kodelet-linux-arm64"
      sha256 "6d1b38c4db5137459b51f38d1caa6e20fbe6a2212e1e76d86d85cce79579d0c2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.6-beta/kodelet-linux-amd64"
      sha256 "5ed1e6f511412890ed2164093955a6ebda5d69d1d9008f9b41c348c76c5d6144"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
