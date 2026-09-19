class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.17-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.17-beta/kodelet-darwin-arm64"
      sha256 "4ec52e9a33600158b7425bb6706fef9f240c0c63a42eaf7be7d1fccb2027a0fc"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.17-beta/kodelet-darwin-amd64"
      sha256 "d199a06bda8230ded498a047c9219e9d6be2a8943e94ead5ec912e5bb42f2c86"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.17-beta/kodelet-linux-arm64"
      sha256 "fc284041bb7453e421ba25daeaa0c2ba034cd15dc3d7aae5e7f77b263041ed74"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.17-beta/kodelet-linux-amd64"
      sha256 "0bbdd950cb717931896c1b87e03665fc09ffd712fbf54bcb7fbe35f88cfe75fa"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
