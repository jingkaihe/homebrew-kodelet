class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.18.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.18.beta/kodelet-darwin-arm64"
      sha256 "650d332cd1fcb3de486a5f4fe505b6ad74e0e02a214a585960ad88134facfc2e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.18.beta/kodelet-darwin-amd64"
      sha256 "af3bcbd15bf850ad2cae22af999b3b63d005ca1c92a44baa03dafe884e84b404"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.18.beta/kodelet-linux-arm64"
      sha256 "38d4cd2aadd30d1ebb1d25d004967bc5d411ba14facceccc514cf8f1fd1ff231"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.18.beta/kodelet-linux-amd64"
      sha256 "19ed12ad71aed9f9076e891ae2aa66f4b87ba78cb40d343830c82e19fce4151a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
