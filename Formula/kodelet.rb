class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.20.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.20.beta/kodelet-darwin-arm64"
      sha256 "a667ef93badc85b12ecab116de27c05297a8b1bec890908535a6010f87ab6153"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.20.beta/kodelet-darwin-amd64"
      sha256 "b2f7e6134a6bbb1f6c6d754088b00366d52c11ab30039764d16166275db2ee26"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.20.beta/kodelet-linux-arm64"
      sha256 "0a48af804a45050501ce4ece955a3ba80b1fc667b5bff29634ca7c6a79395534"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.20.beta/kodelet-linux-amd64"
      sha256 "a1b1a272da25c3f5bb1b79229985e6bfe17f8d67a6db4d6d95ba04423588be7e"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
