class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.18-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.18-beta/kodelet-darwin-arm64"
      sha256 "ccd05c2d30497845e4cb7a381154d797b4d6597fe4c69e07d9dedc25a438ca60"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.18-beta/kodelet-darwin-amd64"
      sha256 "681b9461d4a5981683bbfbec200d3718262d77128dd005dd8ea260a72326c16e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.18-beta/kodelet-linux-arm64"
      sha256 "27cda992fd0402eab76a440f920b913ea18f0c85f58f3b1e73bb865de54d03e4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.18-beta/kodelet-linux-amd64"
      sha256 "5286685dcfdab0084abc38c45a8c8063ab3ad0a82aa31e612e0ecd4eeec599c5"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
