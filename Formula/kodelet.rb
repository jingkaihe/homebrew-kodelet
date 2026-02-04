class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.14.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.14.beta/kodelet-darwin-arm64"
      sha256 "1a82d41f2609117353fd9c1820676550bdbcc097eac8620aa98fb3d6bea3199d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.14.beta/kodelet-darwin-amd64"
      sha256 "0f943640602091574d84bdb3ad029cf6170a3b9e65354a359fba1ecc2dad09dd"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.14.beta/kodelet-linux-arm64"
      sha256 "f2a313d51f6c53bdc8717bad791c5cba8cf871fae18ea8142b286cadf6d7c6bc"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.14.beta/kodelet-linux-amd64"
      sha256 "9ce85be4371c85f4fd822955164b44e6cb605801db91dc9d8f446a8420b27368"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
