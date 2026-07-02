class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.47-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.47-beta/kodelet-darwin-arm64"
      sha256 "32077627e5bfbfe766fdcbfcf89a00cf357433ef9cc50476eda96ddca852d173"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.47-beta/kodelet-darwin-amd64"
      sha256 "8103059c3fa7331c73b7eb2f5ec3c4070d626818c3ad48ec5e1c30b93860ad10"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.47-beta/kodelet-linux-arm64"
      sha256 "5fb27a7b25a9e20f75b8a839feb2ee80ce41f9e08c9f9ff10d75402defd84edf"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.47-beta/kodelet-linux-amd64"
      sha256 "52d2f5b60868708abaa332ecedc4f3546f907efc13e32efc4ea0b90fb2b01380"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
