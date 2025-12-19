class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.24.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.24.beta/kodelet-darwin-arm64"
      sha256 "79c39652c0e7bd8b5cacda02948db2ae870927290a480f7a495ee07d03df7d0f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.24.beta/kodelet-darwin-amd64"
      sha256 "19772d64558882cbb6dceaea17ee188a4acdf70d715b17ee3c17b8ffab6675aa"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.24.beta/kodelet-linux-arm64"
      sha256 "c2cd46514f14fc11c4b16fb0ad52581cb3ee84ea5f7f7a9e88b9cf848aca0cc5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.24.beta/kodelet-linux-amd64"
      sha256 "313d4cdbc856608f5d597d4faf129774ee5ae2815d828c0a4b83937015c62c1b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
