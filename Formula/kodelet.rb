class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.33-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.33-beta/kodelet-darwin-arm64"
      sha256 "72336d4e3778379bc325c2efe8a4c693e7e1892cfc9d8f059848b7db1d0594e0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.33-beta/kodelet-darwin-amd64"
      sha256 "4a31c38ca06f9b962c33922fc55d1fcadc4a3b1dd74864ddc3ec80fdbca4ff5f"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.33-beta/kodelet-linux-arm64"
      sha256 "79d53c40394283bd1097d5ad42fcee6f2204f9b4f3fd35442f2f964aa62b55ed"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.33-beta/kodelet-linux-amd64"
      sha256 "2531639205033ee51171e87968ec0f161d2f3443dad658156786771294cf7756"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
