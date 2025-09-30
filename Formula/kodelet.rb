class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.4.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.4.beta/kodelet-darwin-arm64"
      sha256 "4f1591f8a944419e7278f736ac5e342c7f03168f8cdfe552bc8b2807d4b9c41e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.4.beta/kodelet-darwin-amd64"
      sha256 "35703d82205af4a2c3de81bf804f2676a3b989333d9568e923f8d5f7e5ee44f8"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.4.beta/kodelet-linux-arm64"
      sha256 "3fab45088efb2e5df2d137338fbb1ca0bccc67ce6c7c1c0a7cf65e4b44b8d4bc"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.4.beta/kodelet-linux-amd64"
      sha256 "c9aa13b96a7fe469a3009248c327f710cc6eb0a823e2374d5cbb3d54d6a09134"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
