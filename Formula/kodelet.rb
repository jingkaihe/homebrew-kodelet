class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.16.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.16.beta/kodelet-darwin-arm64"
      sha256 "934c5caa3cdaad3554fc74e1b14b86b027f5ff061db5931bee32ffd58e769113"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.16.beta/kodelet-darwin-amd64"
      sha256 "1ed0c306540fa637ead73ac777147a7d76e2bc29995b469a52ed3c7782c3700e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.16.beta/kodelet-linux-arm64"
      sha256 "7d0fd71847137af71150b3d7e05fabe713ba80fde873dfafad968617be5d1a68"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.16.beta/kodelet-linux-amd64"
      sha256 "d292b3f4727f59ea5909b80db558026c9aa52ed42fcc49eb4257ad8a20bbaabb"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
