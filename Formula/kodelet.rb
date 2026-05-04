class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.1-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.1-beta/kodelet-darwin-arm64"
      sha256 "49f4da8274a8b26c4eff9b07f09a085be528e45c73e8a0507bf59208ce65c9a8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.1-beta/kodelet-darwin-amd64"
      sha256 "a6e194aab8e6f0af87be0d4c169b26147d14ff295e9f44cc171e110caa805aba"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.1-beta/kodelet-linux-arm64"
      sha256 "ad436d4ecd3e3ae64aa9999bcdfe39211b3d79fadff6359b2fe4d735df2da1aa"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.1-beta/kodelet-linux-amd64"
      sha256 "7697319b05b8b74944098bca3557183dc3b109c5ced733a582ee50caafd84ef6"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
