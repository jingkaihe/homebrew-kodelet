class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.0-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.0-beta/kodelet-darwin-arm64"
      sha256 "c92956feab6f6d9e9e87302769b5e9fa553e1123579f2770419205623eeb5bdf"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.0-beta/kodelet-darwin-amd64"
      sha256 "083b9a20755eef2f5d13626b079257d7f6677d44335a0532d50b1bb270d66c02"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.0-beta/kodelet-linux-arm64"
      sha256 "0bc6cf86b83e0c7da5cecd2de52d803eba9e97bd7aa6361c1a9f5d07ce501795"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.0-beta/kodelet-linux-amd64"
      sha256 "9bd437211fbea97bbafd831c60d982743ff676160beb9365be07db3a63f47fe1"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
