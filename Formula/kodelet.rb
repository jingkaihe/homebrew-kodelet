class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.15-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.15-beta/kodelet-darwin-arm64"
      sha256 "4c5a4b6d7f0521985c31cde9a3ea484d62ed2180b84b0dc4d5f30b244ff89dea"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.15-beta/kodelet-darwin-amd64"
      sha256 "013af0365b86688e20b7b70bd99454b0f51622aed5a732f4bd166224d3281af6"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.15-beta/kodelet-linux-arm64"
      sha256 "d54ec7e3f88307afdafe2a1e3e3b7fc58283a481fe62cb2796a689ca67df81af"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.15-beta/kodelet-linux-amd64"
      sha256 "f194634d9409aafe23ce9d36548f0334e3ac31a610ca5cb94168e88b0c0ddfaa"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
