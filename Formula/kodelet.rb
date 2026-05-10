class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.7-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.7-beta/kodelet-darwin-arm64"
      sha256 "a7274d66dd44a7c878bd3a806dce7c2021c88e33b2e80661f6c282129750c2e7"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.7-beta/kodelet-darwin-amd64"
      sha256 "fb6e8aa03112198441444ec6095e3d38f9537d1b66f399cfba53f4e350aba5bb"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.7-beta/kodelet-linux-arm64"
      sha256 "307a2dc2023040e8a7af308ce58c4bb9e07d7e4c70cd0cfc729cc4250324d0d4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.7-beta/kodelet-linux-amd64"
      sha256 "48fd4a85bfbf03e7358aef102ad2429f54243aa3f47b7ae7d8a4df6ba0cb22e8"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
