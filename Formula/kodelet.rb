class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.25.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.25.beta/kodelet-darwin-arm64"
      sha256 "b15f1a7b39e59cdd605b090a7fff000d693e7d669d3ca663e60bd1e7da438307"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.25.beta/kodelet-darwin-amd64"
      sha256 "c2672e169a7c180328c19a514aa5b649e0209e9c2814bd889393a5cbc955d212"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.25.beta/kodelet-linux-arm64"
      sha256 "f395c59126b753826ec141d1a72d8918926aae62f9378fe6245eaee605dcd62e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.25.beta/kodelet-linux-amd64"
      sha256 "9dc60866837075b1e4e832a15c4415e25ab8b1a6ccf9bad6a5347d6370aa1998"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
