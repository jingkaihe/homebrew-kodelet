class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.37-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.37-beta/kodelet-darwin-arm64"
      sha256 "4a7975597d718b57003c53c05eb146e58059af6be0b6b822b72abcdb5289c3a9"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.37-beta/kodelet-darwin-amd64"
      sha256 "8e8ec48a86c218da08a7215306bc30de54db528dcd6e928f8cf712bdcd2b968d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.37-beta/kodelet-linux-arm64"
      sha256 "94105e058b611f3c44b537e3f47f4ffc7eac83dd77354fc9e9f0d4e8511c3f33"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.37-beta/kodelet-linux-amd64"
      sha256 "680ca530fcb94012c38b94b3949346408cc708922550d8e1c6f4baffd3d631d8"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
