class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.21.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.21.beta/kodelet-darwin-arm64"
      sha256 "061dbceaab08946f8eb8b0863b6c8d915d98fa9b25119e141ff426bfc2000fdd"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.21.beta/kodelet-darwin-amd64"
      sha256 "488c59e2335455acc0a8ec2cf3a623b0cc1df9ae2ce8440afc6f788edaaf83be"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.21.beta/kodelet-linux-arm64"
      sha256 "54c2568218ef7af5b9205ac5c0b9c95e19321226fe2f866ec16bee463863c64a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.21.beta/kodelet-linux-amd64"
      sha256 "b8ae99a99f7c9009f3fc43ee9d9156f9395a53f87b30c4a62a91b889d84cfb9a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
