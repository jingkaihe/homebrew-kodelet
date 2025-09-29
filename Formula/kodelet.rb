class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.1.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.1.beta/kodelet-darwin-arm64"
      sha256 "4a59c2912fd4e5b1c602a69f0cf5bf407060519cc2d2559bf7cb7ec8354be4ba"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.1.beta/kodelet-darwin-amd64"
      sha256 "57e43a4b27a50c7a744bad2132d82b303368ececb509ae7aaf84ce2a2d84a02d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.1.beta/kodelet-linux-arm64"
      sha256 "bbb6d3b2621d0ff4060ae40168cb7283fe298ac64e5e05c9472b234e1dea2a84"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.1.beta/kodelet-linux-amd64"
      sha256 "c479c64b6f4ecf67bf1ed1acfa2fb0b72dcc7723f2756a5462b719c5bf80f873"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
