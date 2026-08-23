class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.38-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.38-beta/kodelet-darwin-arm64"
      sha256 "df79f3ca0377b49a13bc4f1cab9c6013e3fbe93135480d028c63fda416575f57"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.38-beta/kodelet-darwin-amd64"
      sha256 "d4672f70884bd0b4df9631d296a6ff16167662e73829ea086ab4cde56405f8d1"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.38-beta/kodelet-linux-arm64"
      sha256 "40f5c3dc7ce23998f242b08e206d0f2744c7efc67a6ec7a25e453a42b2bfdf4b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.38-beta/kodelet-linux-amd64"
      sha256 "3425058b7bb535b7d42c20bf8abeca4d4b8153c0c0b4e5eec2756a267b76d291"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
