class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.18-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.18-beta/kodelet-darwin-arm64"
      sha256 "3ac4833f620ec5bfba074cdf4376e5a846ecf44d8e7e793bb22864975ac1ec05"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.18-beta/kodelet-darwin-amd64"
      sha256 "fe43cbcd1c3f18ae329a2b72bfbf3fb0546752922c8131aa7819ae9318d583bf"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.18-beta/kodelet-linux-arm64"
      sha256 "3c78f30341f6a11fb833b326fc9ab6593b530fd80273bda728c4ea548fb4ec60"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.18-beta/kodelet-linux-amd64"
      sha256 "706852ce5422660cdfb9a55267b947c6c8fe353afb1d32b8b1b44f424a3bf144"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
