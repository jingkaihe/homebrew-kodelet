class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.17-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.17-beta/kodelet-darwin-arm64"
      sha256 "71f9e908c340bc4025c889174a5719731d0f5ba5695eb5f33542030fe603360b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.17-beta/kodelet-darwin-amd64"
      sha256 "f5ace5d217c5e1c8093b9fb4731518163d4f407df81f446764ce0af373d8e93b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.17-beta/kodelet-linux-arm64"
      sha256 "4bdc55d758d96de5fbd6b6b5719f2656c0d1d5af50275688c7a55e00c9467302"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.17-beta/kodelet-linux-amd64"
      sha256 "0647fa547d9d0cb5155fd8611442783ab27592ebedd976baade235c9ddc20343"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
