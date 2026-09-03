class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.44-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.44-beta/kodelet-darwin-arm64"
      sha256 "de922e2c64eb14a167489b9dc712a62fb8ef4ef8e55e8e4ad130fafbc05c4dff"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.44-beta/kodelet-darwin-amd64"
      sha256 "157ccf415e494613bcfea02214a42e21dc416a79181b8477990f265f9a394d9e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.44-beta/kodelet-linux-arm64"
      sha256 "9dd768afb9e15a99100aa05d0a5b295fc58e17cfd445326fe306992a68ba28d3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.44-beta/kodelet-linux-amd64"
      sha256 "0f405c53bb41ded650ad8fc0d480f8886315fd58049b6069997d6d5a2a629004"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
