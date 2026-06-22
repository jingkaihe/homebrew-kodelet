class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.40-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.40-beta/kodelet-darwin-arm64"
      sha256 "e3654953deaee7bf0eddf27d0bd03d635a547166ba9f379de3ac8d4567c3d689"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.40-beta/kodelet-darwin-amd64"
      sha256 "1861d3a557a9b5add54d7e1dd28329b41b52ec491a1d29ae35a167e173e79e3d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.40-beta/kodelet-linux-arm64"
      sha256 "4c665e99d207eb4109ee40e9033c4d0be83be398592d52b35f9de7d491186237"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.40-beta/kodelet-linux-amd64"
      sha256 "892e4fd561e6813d02fed8c29f57f796938a604aff3d4360d0f309270ecd23ce"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
