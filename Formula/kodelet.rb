class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.31.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.31.beta/kodelet-darwin-arm64"
      sha256 "6a89e9a9da37c93fc0ee211e324dd4b3a1aa2ba1631ed92a12ddf05f3809c553"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.31.beta/kodelet-darwin-amd64"
      sha256 "8d6d0e3b19c627e04fc7278e781994fbc05ee57cba4e52aac85c101763a55177"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.31.beta/kodelet-linux-arm64"
      sha256 "caa12e5e79d90aee42eb78613a704cf6a036b86e43457019ff0844c96a5a6ec2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.31.beta/kodelet-linux-amd64"
      sha256 "0b1b0ed73146b239b24d30161ea3dc6453ff94cb405c76489b3817c49e173e51"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
