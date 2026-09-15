class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.15-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.15-beta/kodelet-darwin-arm64"
      sha256 "f760592cab23ba63602f9a9eb3d67a5ac17d75b07b7e7c97ae4d8b8ec11f5f92"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.15-beta/kodelet-darwin-amd64"
      sha256 "340f9173e16cef94a669a0b9ddfc96ab6cd582dfe0afd6e73be9830fac8dde03"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.15-beta/kodelet-linux-arm64"
      sha256 "9d0b47fb5d2ba2f573d6007bc9fbba02aba60f9c866d95231cf7cd1975c5d827"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.15-beta/kodelet-linux-amd64"
      sha256 "74d3903a6e5d9618e62c82a11861fd44007b2d30133058b6d49d239a59554522"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
