class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.34-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.34-beta/kodelet-darwin-arm64"
      sha256 "48637b806618083181ac2d43e67bc0d2d13cbe8b91f89cd6a3bbfadfb10086d4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.34-beta/kodelet-darwin-amd64"
      sha256 "d0f5c561e8add7384fbc2459ca15bcc6b08ffeaebba660115ad9a1c81af79533"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.34-beta/kodelet-linux-arm64"
      sha256 "62e9be1f53f9e9d4607498de4b6c973b9df6a5a809710426410a1f043c57fb63"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.34-beta/kodelet-linux-amd64"
      sha256 "7a97c433781f39e1330a12fa9ef6cdc9a5a0aedff1306c3d0c2343121bf9fa31"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
