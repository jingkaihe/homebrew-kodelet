class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.7.3-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.3-beta/kodelet-darwin-arm64"
      sha256 "7161cec028c185c3ebe6bf256c14ec2fadc947417957f4258628b63c931b6272"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.3-beta/kodelet-darwin-amd64"
      sha256 "4ce2dd9358aa8107e5a516f15519d7ebf57a0d0c4162487e64f21aa43d8ca117"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.3-beta/kodelet-linux-arm64"
      sha256 "5eeb0eebafd08989e8ec67376a7f0ba85343f4def6bf72ae11b138c3fff78530"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.3-beta/kodelet-linux-amd64"
      sha256 "7d1abb480bd4c23aef3efdbaeb888e9c7075684e344966573111cca6cc2c7233"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
