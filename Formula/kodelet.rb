class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.0.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.0.beta/kodelet-darwin-arm64"
      sha256 "430995b6fa2103f897a886e19188c54a9a9c7b5fb94fdc3dca73a778f2b83e14"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.0.beta/kodelet-darwin-amd64"
      sha256 "4450dbecce67a340f315a93509b55fd336146806a570187c78c8b4e2df8a4f02"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.0.beta/kodelet-linux-arm64"
      sha256 "c4c461102ccce984dbdf8929b1c1e735af08f4837016b50a93a046a250f49e02"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.0.beta/kodelet-linux-amd64"
      sha256 "f52748f69f3dabfb05c82bf39dd8f91fd00c7ba23bfebd9cf69014f624a6c59a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
