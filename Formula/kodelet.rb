class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.3-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.3-beta/kodelet-darwin-arm64"
      sha256 "ffc6eade813eacf134924c61092b871cea580249937a5652e72f82270df18f63"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.3-beta/kodelet-darwin-amd64"
      sha256 "19d039c8cf2a88eb3f71738f757934254762a752fd4bde557e7422646954104c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.3-beta/kodelet-linux-arm64"
      sha256 "9fae98a46c78c12fece42c0d8680373a7b02eca5e376007450737951064e0f2b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.3-beta/kodelet-linux-amd64"
      sha256 "5c64036ab33e8a9184fa78f6b3fb167b587f75ef51940f610505fe8e71b12dc2"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
