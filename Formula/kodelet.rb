class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.20-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.20-beta/kodelet-darwin-arm64"
      sha256 "1073edd36f5bfd7ef7355571f8d8bbecbc93f9ba66fa45cfb807541091e4a6fe"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.20-beta/kodelet-darwin-amd64"
      sha256 "d8655ecbfd491a6895abce7c59deb4441b1aec86aa2ced12c769d57aa410c8e1"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.20-beta/kodelet-linux-arm64"
      sha256 "1d8dc427b33542af5283c5ef808277cf924eaded9c595ea6468909ce94f1ab1c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.20-beta/kodelet-linux-amd64"
      sha256 "51afae1a66d1bf9bf9b70b2d982d4b6f0bc554311e48b206fd73ea40cbb98dfb"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
