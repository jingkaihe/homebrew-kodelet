class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.21-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.21-beta/kodelet-darwin-arm64"
      sha256 "62e66a99eb2df91845689d3593e8dce1198b4d13fcb1aee03a1de7480ddf4986"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.21-beta/kodelet-darwin-amd64"
      sha256 "9ef133119c65d1fa4b9f9faffaebcb65c49bc6c97efee76e243a21681ddc9e3f"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.21-beta/kodelet-linux-arm64"
      sha256 "d0a6497791698cfd0003776fcaef2136cf180adafd64e49197247f94d26b7566"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.21-beta/kodelet-linux-amd64"
      sha256 "aad8410a3ce1d89f39bd67fe7937fa9713bb7516f2be3bfd3c08033d358bad28"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
