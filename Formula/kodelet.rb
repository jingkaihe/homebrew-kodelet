class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.18-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.18-beta/kodelet-darwin-arm64"
      sha256 "3af39b5677c07d646243ea24fc291309f5e9541e01d6bc6dc91b1b1618eedf85"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.18-beta/kodelet-darwin-amd64"
      sha256 "62d0212726623bbec72ea2011f823142f7cc4f4f90a74fe5dde85d89aa204efb"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.18-beta/kodelet-linux-arm64"
      sha256 "151b0968a2b6902627b486b68345f3ccfb81edc1632953e6f50180f851fac577"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.18-beta/kodelet-linux-amd64"
      sha256 "8b4b2853bbaefde02bd108ae5ee692bf468ef80f640c86c07058b49e3b00c5c5"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
