class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.3-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.3-beta/kodelet-darwin-arm64"
      sha256 "58f4cd09f92d8714cb4df4b8325a973696f93ad258485007ed9688e92e10668b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.3-beta/kodelet-darwin-amd64"
      sha256 "fad96216ee70163f711fb82f9e8c58953c70977dea19232e71568b6e72c808de"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.3-beta/kodelet-linux-arm64"
      sha256 "877450e5ca291db6afda6085f37bec9c0994b413cd3783c9b466487278db7065"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.3-beta/kodelet-linux-amd64"
      sha256 "1779c5ca8c57b28b216f4ed6101d79b3683a6bcaf501869222aff61fcc41b379"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
