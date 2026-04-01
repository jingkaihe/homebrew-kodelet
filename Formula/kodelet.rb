class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.22-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.22-beta/kodelet-darwin-arm64"
      sha256 "c1e3e267747d767b6033a19c5c3beb28da9e2d2c5e2ddfb7bab776175e3a8264"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.22-beta/kodelet-darwin-amd64"
      sha256 "d3f9c18ba5023fc56ab71e59512c51f600943665e986ee7752efe6cd70800434"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.22-beta/kodelet-linux-arm64"
      sha256 "76e9f73479cc8cc1a8e3d5ec03b4a1b7dc95a31a1b810b5ae75fa7af1d1e7346"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.22-beta/kodelet-linux-amd64"
      sha256 "f49d8afcd2970c4956113ff3c5cd121ccb9ebf4e34379660c5136b851152e60f"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
