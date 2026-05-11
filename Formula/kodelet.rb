class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.9-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.9-beta/kodelet-darwin-arm64"
      sha256 "097f0b596e47a003ecf7b626c89a5ab8a989e415039727d7ba117d81cb5ae41c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.9-beta/kodelet-darwin-amd64"
      sha256 "7fe3013975f3a92eb2aab77a152044f9f4d9aff21793687c3e22b2e99ae345b6"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.9-beta/kodelet-linux-arm64"
      sha256 "c5abe13ce3238527c8bafe9ef8d1822e858ffc3a71704e52f7c11af21474c590"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.9-beta/kodelet-linux-amd64"
      sha256 "5e4050ab0d8ff702183af90d78ba70c0f61d7130766fc00907ae6045b8fca634"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
