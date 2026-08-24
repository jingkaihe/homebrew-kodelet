class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.39-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.39-beta/kodelet-darwin-arm64"
      sha256 "042131d1260954b75df738a2f0a0cccdba39859bca78d1398b74a74d4f1d5147"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.39-beta/kodelet-darwin-amd64"
      sha256 "5b3408c33ff616abfa325e39e3456b3bdd9c39498b7105e925b98b9eb64ac22e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.39-beta/kodelet-linux-arm64"
      sha256 "9700519b6dc9a1ca6fe4ad53dc058833aaf94e645af53ddce28f271f8701c8bf"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.39-beta/kodelet-linux-amd64"
      sha256 "9e40f394e718ec798cf8745171ee419da31a29b40ed7f3ca8817a99ca3bd1e93"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
