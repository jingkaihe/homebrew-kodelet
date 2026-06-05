class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.32-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.32-beta/kodelet-darwin-arm64"
      sha256 "0a10741f3b9a5211b2e7f8340b48bbd17fa3f0476235ff47db744b3c5e0b3b4f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.32-beta/kodelet-darwin-amd64"
      sha256 "888d4a5d6575acca9f86716d40ce47c18515864428390ea71ddcda455d0487d6"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.32-beta/kodelet-linux-arm64"
      sha256 "26c4b001b002952fe955a67f86764a35685becb12bfb98aca0c75dcc9749783d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.32-beta/kodelet-linux-amd64"
      sha256 "e82f10bc602da9cad1dcdcb4fe1d7aaf150bda0ceb0e80aa763402afbf902745"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
