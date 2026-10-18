class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.8-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.8-beta/kodelet-darwin-arm64"
      sha256 "02e118afd7ba1f355413a7a2b7addd9d5feb6f057cdde48ada11a5e70473438b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.8-beta/kodelet-darwin-amd64"
      sha256 "06cb2fe74a7f14bd72dd09fa0f5ffc34262db8c9bcd2f8356ec569d431207059"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.8-beta/kodelet-linux-arm64"
      sha256 "d31cc1db93032d2e4c46fa365def5aad1887368cb3159f1fee38e3716374f624"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.8-beta/kodelet-linux-amd64"
      sha256 "c8ccb4645d68150a0536c23b09ece35886cce3bfb09de815c51ba5e63aff9cdf"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
