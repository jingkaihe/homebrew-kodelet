class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.42-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.42-beta/kodelet-darwin-arm64"
      sha256 "028b3f4f62efa922d7d1d3b3b3e7586cfe4d149579c22f9914a771565dc18342"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.42-beta/kodelet-darwin-amd64"
      sha256 "562c97022bb05e48e2e9e07923dbee0b1d234b931b2ba24f0e8c69db001a363a"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.42-beta/kodelet-linux-arm64"
      sha256 "14aab21729196757d7bcff6737df0d51f58f63aa7510a5ce8559babaf72c766f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.42-beta/kodelet-linux-amd64"
      sha256 "df0935f4ee6eb5a2334e1b46c995fe77defb3e4479902b92424c36f0631091c5"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
