class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.6.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.6.beta/kodelet-darwin-arm64"
      sha256 "fb8287efdc72fc3822dc062b586817d012ce136ed157f005fc9f9a85a6791283"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.6.beta/kodelet-darwin-amd64"
      sha256 "772f31537798f0b8eae2f113747ded539ee6c533896821e3db64816ca6c02b64"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.6.beta/kodelet-linux-arm64"
      sha256 "550dd1dc0d12361622088ed01774000ed3a76c998bfec6b0dcf90d1741e61822"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.6.beta/kodelet-linux-amd64"
      sha256 "c22c74252a248ce521d5231f18f8c56a7c0644984a1642b17fe22fd7ea651e61"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
