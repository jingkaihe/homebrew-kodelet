class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.52-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.52-beta/kodelet-darwin-arm64"
      sha256 "2b94190594066466a935d44fee3ce91810d6fa213d1761fa01304129ed41ddc6"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.52-beta/kodelet-darwin-amd64"
      sha256 "22e141aabe9bbc3b9d95b555a85ee782b4be437d249f7fea7dd8098044c01f14"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.52-beta/kodelet-linux-arm64"
      sha256 "6e7b1c02b6ee12ce8443d4b252a6a4f2ad81eacae9c58d61303133f3e342b6e3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.52-beta/kodelet-linux-amd64"
      sha256 "2f868717ec8807accc82a688d800eb0896f68c13925e5012e8e3641f7272649b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
