class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.19-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.19-beta/kodelet-darwin-arm64"
      sha256 "c426b7aafc4ae0748a405f7484c35f728375e1ad642aecc88316a70e60d8168e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.19-beta/kodelet-darwin-amd64"
      sha256 "d86cc96ff33c795eb72a861907d496a27d8fbdc92f8c8760a3d10dda722c7e1c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.19-beta/kodelet-linux-arm64"
      sha256 "a211fbadff4e5529fb0a59ca2c0869cd927fe5edacdfa6940a64bf08ba1be09f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.19-beta/kodelet-linux-amd64"
      sha256 "fefe027d729fbd98e88d89aa8ae3ea1b770f5634f85fd2ac21e27a05d54cfb48"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
