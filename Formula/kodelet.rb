class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.33-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.33-beta/kodelet-darwin-arm64"
      sha256 "84e81caba0890d79aa856a12ea6ce2518202178a6bd0b6fa5d4c570ebbbcd267"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.33-beta/kodelet-darwin-amd64"
      sha256 "7701c9d91c0165df0d3d5f7b26988d34c296ea3f7be601cd3b453ae3abfd644f"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.33-beta/kodelet-linux-arm64"
      sha256 "9649c3f5883c117a5ec097997d1f9a9895069b0110868a9763c27a9430dbfcb3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.33-beta/kodelet-linux-amd64"
      sha256 "d392abb160ca756b17d8d42733699e94031a21bee1a83d5b62025d1d654b23b4"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
