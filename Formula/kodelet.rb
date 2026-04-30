class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.50-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.50-beta/kodelet-darwin-arm64"
      sha256 "4046960bcdaf9810227121df03460c678634ea020163a192f7a5dabc05263fb5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.50-beta/kodelet-darwin-amd64"
      sha256 "640f0bcac9dd3232f6194ee622ddc072cf2b41cfe7c9905892dc7e90b94d82d1"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.50-beta/kodelet-linux-arm64"
      sha256 "17e3ba7716823142bdafeed855bb6d20ac985ac49aa1526736a3d3571bb4caf3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.50-beta/kodelet-linux-amd64"
      sha256 "1d8a84033b00887574333b6d165b66122950cc261251ee428da0be8253495eca"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
