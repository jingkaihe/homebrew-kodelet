class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.11-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.11-beta/kodelet-darwin-arm64"
      sha256 "a752e08f8112e60eae110276c3ed7b9f020bb237ec6be13da584c931da2a5893"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.11-beta/kodelet-darwin-amd64"
      sha256 "0b8dffe8ab56355af82bb27263098abec082f8cc919eeeee314bf56101b8ab7b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.11-beta/kodelet-linux-arm64"
      sha256 "83429e93a8ff542a1c30568e8159f9299f6390944a2356c2e955c43d146480c0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.11-beta/kodelet-linux-amd64"
      sha256 "140a6b0e5b42830d0dc94dc5109ddf3749aa07684e089e50081d0e8aa4e1709e"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
