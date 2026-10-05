class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.7.4-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.4-beta/kodelet-darwin-arm64"
      sha256 "aecbbbbb166c7a4c9d82f31c9302729b4d1702bf676a4fe30322e4d0f64cda37"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.4-beta/kodelet-darwin-amd64"
      sha256 "07d0b6dba5f62ffdbff28f9239f112509519bbde1627d037fedb18a7f2870c77"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.4-beta/kodelet-linux-arm64"
      sha256 "fb7bbf10826d62c48fe74feda5a4b94974b881e1df0e45a7febb979111cfa83a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.4-beta/kodelet-linux-amd64"
      sha256 "96193a8ea134064b93df5f8b47d2891910326b617033c34ed4d1f3a5961563f4"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
