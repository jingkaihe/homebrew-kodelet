class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.35.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.35.beta/kodelet-darwin-arm64"
      sha256 "61b31bb8c96fd14765e8ef4b4be3d7c569269a4b7f4ae977a3b9a13f5b0fdcce"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.35.beta/kodelet-darwin-amd64"
      sha256 "ec342d905e484b52ad3d32905b359f5a0597d2573ec1e732535c517fa32d1a06"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.35.beta/kodelet-linux-arm64"
      sha256 "5783fa84ca5eeba44a0c5b82c18f6de7041bd214085a42ddfde77d15eb66ed52"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.35.beta/kodelet-linux-amd64"
      sha256 "98fa12bd3ed1e401b8f8eeacf50d43bba705acf1ff90d974f819e06e6e9ab0a1"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
