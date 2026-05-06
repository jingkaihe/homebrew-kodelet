class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.3-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.3-beta/kodelet-darwin-arm64"
      sha256 "ae9231d0a8da1898385ec67794894592e0f5b7363fe0528f7288ba452a77f8fe"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.3-beta/kodelet-darwin-amd64"
      sha256 "4b2a882c4cab15e294c08b5fa3133263e590d3b3bc54dae1693dee1a2d4af079"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.3-beta/kodelet-linux-arm64"
      sha256 "67af74995d071f9b93f222024a1b9e44d143489ad536a13d473fc358d02227f8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.3-beta/kodelet-linux-amd64"
      sha256 "a16cd06222676e0425327426c96c993e7b9ecfe2b729b9f7af5e5985d5c147d7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
