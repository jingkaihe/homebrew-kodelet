class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.5.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.5.beta/kodelet-darwin-arm64"
      sha256 "c7c51e3f2560c7451964e315ae36c5a6107b8fa6a0fa7b15fe366eed9626c8aa"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.5.beta/kodelet-darwin-amd64"
      sha256 "d782421c4f6db5e148df9332c2e51c84ecf10444e8a8359bbcbc3206596da48c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.5.beta/kodelet-linux-arm64"
      sha256 "f60cad496729ef14497d432dd8eca5e450ce39c49809fee27c89559c45e8dfaf"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.5.beta/kodelet-linux-amd64"
      sha256 "430b86f371534c77f02c1b238581abd243294d5a02de8dad40f1ba187ff70512"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
