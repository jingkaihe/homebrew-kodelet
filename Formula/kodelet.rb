class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.4.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.4.beta/kodelet-darwin-arm64"
      sha256 "79bc6266362f39efbf743dd8443c76160447a412a2aa4031431625256304cb04"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.4.beta/kodelet-darwin-amd64"
      sha256 "e028d47d68f44ae231c02a4c0cf503cc0347cb27fb7fd1858124ef7863b85b8a"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.4.beta/kodelet-linux-arm64"
      sha256 "9bc6639384cdfdbf8d6810edf41eaabf243d7d752934bf0f8c0990530c8fc663"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.4.beta/kodelet-linux-amd64"
      sha256 "8bfb8232ef24f3dd1a947e019eff3e34d669dcd39759ec2f18735a3c7e1ac14d"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
