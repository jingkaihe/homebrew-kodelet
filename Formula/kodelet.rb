class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.9-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.9-beta/kodelet-darwin-arm64"
      sha256 "91c55d2d6a5412eef8b4672caaf800182f8ce3340412dff520c554d8066aade0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.9-beta/kodelet-darwin-amd64"
      sha256 "1ef37f738a2a25b7b1b223b6fbbcac43bf2b15b1ee8efb53f3746610187bc8e1"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.9-beta/kodelet-linux-arm64"
      sha256 "126d1857e783c97d3152da47386e7cc73f82c972ff1799e04b86065789e8987f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.9-beta/kodelet-linux-amd64"
      sha256 "1b1db3817a7acd15f702374be69082476ba6a8b7fa1eb1e5203fdee4c1d122e3"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
