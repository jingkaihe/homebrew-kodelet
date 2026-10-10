class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.2-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.2-beta/kodelet-darwin-arm64"
      sha256 "c2e08d39fb6c6dc2cf23f40bb56c51a7e43442ac8f0921fe1949f1b597bc9d8c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.2-beta/kodelet-darwin-amd64"
      sha256 "3398971ba5837e59db137d29a4573d65a97a2ceafb27eab280a11ed9a761176e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.2-beta/kodelet-linux-arm64"
      sha256 "f767cf269f46d9a0ec0d517d129346bd7b77b682bb1764dc0ed3048a14680b44"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.2-beta/kodelet-linux-amd64"
      sha256 "94b389fb56d7c0094349786cec1ed64e5891c8052e7a3c21fe834d477694fed3"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
