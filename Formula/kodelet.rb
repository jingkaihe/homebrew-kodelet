class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.15-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.15-beta/kodelet-darwin-arm64"
      sha256 "bd4ead712a575829cfb8840312a9f957e1f8812af2c3d9367a612fd7c5f673b0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.15-beta/kodelet-darwin-amd64"
      sha256 "54dd07558954cdd9001ffb68cb8e7175ec67db70af83246357f7b636d42bcbc5"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.15-beta/kodelet-linux-arm64"
      sha256 "0cfc5b7f776aef97963712afc98be9d221a5f4140ed63e1ffff6885b59e17f55"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.15-beta/kodelet-linux-amd64"
      sha256 "05850c770f0322ae5c9773519a5981eccf50f9496953e9ff3baf7ddce8b4750c"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
