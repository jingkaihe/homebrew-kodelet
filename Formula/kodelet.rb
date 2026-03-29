class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.20-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.20-beta/kodelet-darwin-arm64"
      sha256 "9965ac509c8bc82a7079990959bd2f1f6f6d379efde897ccf272993626659b20"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.20-beta/kodelet-darwin-amd64"
      sha256 "d0db3594214f8a4ad9ce47df0d6502206cfad24d05c033ff12f710f9382853ac"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.20-beta/kodelet-linux-arm64"
      sha256 "ad0b6058af144f05fdb4d5ba14244d3ce84bce148e73b3a8bb367a5cc73f3efe"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.20-beta/kodelet-linux-amd64"
      sha256 "66b91c7ea047a5a1edcfca071938db326a148fd7b429765566039d5b8959726d"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
