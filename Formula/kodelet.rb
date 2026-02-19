class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.23.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.23.beta/kodelet-darwin-arm64"
      sha256 "c89d28019b3acc64e4ded979990ba2c971205f0ebb5b15b8fd7a3333cfd9ccfb"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.23.beta/kodelet-darwin-amd64"
      sha256 "0595487f6b302d370df9b0827d6af1885a3cf98661234d9bf982272ff415c7ff"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.23.beta/kodelet-linux-arm64"
      sha256 "053faec5fb576ead556b04d924cfbaa432d4c2e52379314a81c38d782c7a333f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.23.beta/kodelet-linux-amd64"
      sha256 "fb84e4bedaca9493a0721c4e532791fa8b65f48682bd4f53200e3708f744b6bd"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
