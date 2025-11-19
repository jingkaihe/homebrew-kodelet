class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.17.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.17.beta/kodelet-darwin-arm64"
      sha256 "7859a270e9d154326e93a49f2fb0261d57a0bc65dc7a2da06bea80399e3b3f97"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.17.beta/kodelet-darwin-amd64"
      sha256 "d4aebfdf436e5344f098e019663f3468464301a3c6c3b58f33a733b63761fe04"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.17.beta/kodelet-linux-arm64"
      sha256 "21dac084158e0f2ceb4db7cd5caa78f9c565539487e5d7ea4d742da79c8ef7e9"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.17.beta/kodelet-linux-amd64"
      sha256 "e9cf0e95e0d10049442215dcfe7730d77fd1df2c0ec4c1aaa479d58479f519f7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
