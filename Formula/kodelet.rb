class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.35.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.35.beta/kodelet-darwin-arm64"
      sha256 "3a61b674847fc3d2a6973af1df5f2fdb748de15b3627e6ea768495501e654a9e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.35.beta/kodelet-darwin-amd64"
      sha256 "ef0bddf0214a25facc3829a0f3aaec59f19b41034975b080aec097bfe869e7a8"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.35.beta/kodelet-linux-arm64"
      sha256 "34cb68528e839f1a7438e6e464102d451fa021a2858711bc8b9c2bfb63737344"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.35.beta/kodelet-linux-amd64"
      sha256 "9d3810773f9406ddb3b98f8bc38669362e39d264bc87adb75d00707f17aff955"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
