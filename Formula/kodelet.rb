class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.53-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.53-beta/kodelet-darwin-arm64"
      sha256 "f0dca14f214f02dc6cdb7ff937a41b720d204687f63ce8fc3f952eab4db0b3e2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.53-beta/kodelet-darwin-amd64"
      sha256 "f6f62b30c6b666dabb4c1ab4cbcaa2251482e0b7d3f36fa530f0ef47f6eda7f6"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.53-beta/kodelet-linux-arm64"
      sha256 "26d78cd9185a557ceaf384deef59b960e7685faf96d799e4b4089ea1d9e17b31"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.53-beta/kodelet-linux-amd64"
      sha256 "0b211981fcfa7ef15befbec7a186f2869f492e762236a03101b321bf47382f2a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
