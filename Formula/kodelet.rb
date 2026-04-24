class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.47-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.47-beta/kodelet-darwin-arm64"
      sha256 "24d01709d54c8c6b6f0cf5cb3c4a505c5b3fb8fbb74a364e862930e6bc473ce2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.47-beta/kodelet-darwin-amd64"
      sha256 "eeffc843dae41f850979d811c46980c3900d707ff393ce91e7ee5beb960a9f53"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.47-beta/kodelet-linux-arm64"
      sha256 "18f69118273496fb1c2ffde3f0cdcb52ab1977c24ed086f2f1d0715558822f53"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.47-beta/kodelet-linux-amd64"
      sha256 "d7f4fd95e64bd80e89cb1dc856dd2ff1878e42ecaadd526f39929746386942ed"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
