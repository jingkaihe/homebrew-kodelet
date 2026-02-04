class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.15.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.15.beta/kodelet-darwin-arm64"
      sha256 "e28c1d4d74b180a206925707706dce7d672f2693b238777b8b8c3fa45a87c9d7"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.15.beta/kodelet-darwin-amd64"
      sha256 "840ad788cfb7fb75f80653a803650f3a58a9fabfc76f3285f634c1024888f116"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.15.beta/kodelet-linux-arm64"
      sha256 "d09fd06e492096afcb1a72cdbaee78e5edee1800732b8b6178de09ba1e1317ef"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.15.beta/kodelet-linux-amd64"
      sha256 "e0c2c4c0e3ae17121f17b0e84d58875fadc43e2beb71f916c91c3bd0a3975807"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
