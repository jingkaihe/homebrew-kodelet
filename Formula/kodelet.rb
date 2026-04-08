class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.29-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.29-beta/kodelet-darwin-arm64"
      sha256 "d54a27f6cedc24a37eca5352dbec81196a4e6859f060de0bf899a787f6023f57"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.29-beta/kodelet-darwin-amd64"
      sha256 "350227a38870d1333384964e210024d2bcfa78951d66d3b2ad69d6c2f4c29581"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.29-beta/kodelet-linux-arm64"
      sha256 "beaac3f419831e8c6f3ebdc56c64e477f9b58928e154ca438b993f29617b932c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.29-beta/kodelet-linux-amd64"
      sha256 "1d99f13396b6c61ee98bd17d6b76bab108a7871aeba0fe48aa0d6ae2eaef55dd"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
