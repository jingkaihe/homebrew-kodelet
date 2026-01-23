class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.48.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.48.beta/kodelet-darwin-arm64"
      sha256 "30e5b734327dfd3cacf171a1dbc2b273d9fa732ea9c690a5ad1867d1126cc6bf"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.48.beta/kodelet-darwin-amd64"
      sha256 "0ebf6e6d43ea46ed7950702c203cb10d48bb35279cd70b6cdac98d55935c890c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.48.beta/kodelet-linux-arm64"
      sha256 "499041c0729c95340ea979f7ab0ae56ce983c9a292932e2f26d3146cda710aa6"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.48.beta/kodelet-linux-amd64"
      sha256 "fc784687904a25bf4545df3bb39737246fba2f19ebd9aff16d198832b640ce00"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
