class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.44.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.44.beta/kodelet-darwin-arm64"
      sha256 "7305481b9057de6833798e6d662ce2af583410850d15973177b6e7719c8bd291"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.44.beta/kodelet-darwin-amd64"
      sha256 "5d0036bcd5b5f75fef96c5091d9c805f5c4cbd9d77df4659ee0bf38a665d900b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.44.beta/kodelet-linux-arm64"
      sha256 "5b9540c9c304d9a978faf21b58fec4c202dc741963767081e3eeb0240090cf47"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.44.beta/kodelet-linux-amd64"
      sha256 "0bc43fc40e3abc66257bb64faf09021ef9f9959b9a74bfeef8c618081b32f353"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
