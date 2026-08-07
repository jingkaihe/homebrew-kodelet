class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.27-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.27-beta/kodelet-darwin-arm64"
      sha256 "9f5d14f89caf42c56620365a5ec650d2740dcd692470fc2087cc4b19f40777de"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.27-beta/kodelet-darwin-amd64"
      sha256 "dd4444b7d451f4891390f876dfe2a5b82d03b2f573935ddd4d0c823f32eb7114"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.27-beta/kodelet-linux-arm64"
      sha256 "a1e100e788e8699ed55f304047323251f2e789135f76a0157536f90605f4e1d0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.27-beta/kodelet-linux-amd64"
      sha256 "0adecfd2a5b0bba6ce2c7d6ed9c739f6e5dbf5407abdfc76feb333950bb76f3f"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
