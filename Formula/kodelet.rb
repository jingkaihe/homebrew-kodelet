class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.4-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.4-beta/kodelet-darwin-arm64"
      sha256 "9dafac13a6742066d83f683f353996728516658d351c21287145fa5c48b0b44a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.4-beta/kodelet-darwin-amd64"
      sha256 "a257c3efb6113dbffa2922c62fecbf9a22f106c3167066bc241299f9aadca0f3"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.4-beta/kodelet-linux-arm64"
      sha256 "643471b779a1da3fe725985f087bce576f6e6ff3e3f6d4055dd2f6ef8dee8bd0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.4-beta/kodelet-linux-amd64"
      sha256 "2251366022f428feeaad3506cf7225ea96043a8ad3593f2ec7c82d08fa275f95"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
