class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.43-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.43-beta/kodelet-darwin-arm64"
      sha256 "d9e3a0d3540cc863b1048ab26c5b780fe087ed739c6fc888f863c6d160e19eb4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.43-beta/kodelet-darwin-amd64"
      sha256 "4d4f2283015b7f8a06b74ca6d7ccd3c2e61f9dbeb78ad9476fd8848a72cd3225"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.43-beta/kodelet-linux-arm64"
      sha256 "71098acb850a90000c8115d7695f15347125577bfba3defc9bd3c1ed0587ff75"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.43-beta/kodelet-linux-amd64"
      sha256 "12d064df85a8c44cc0128554089013ccda1eda397094df580cb8e0343338de23"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
