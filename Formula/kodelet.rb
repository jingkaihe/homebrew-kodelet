class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.8.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.8.beta/kodelet-darwin-arm64"
      sha256 "50065f6f479abe81c5161ce73c935b5228774549686af5671f60a51ed06d814f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.8.beta/kodelet-darwin-amd64"
      sha256 "7da2421fbc51aa1f304e71b1b3aedda5ae93d49c67075b99cca859339d43f419"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.8.beta/kodelet-linux-arm64"
      sha256 "371420b915b967bd0023aa284aacc27b92c36cbee2b784de289355b7fc1e1a26"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.8.beta/kodelet-linux-amd64"
      sha256 "a27da2d1c3ff34e236ad4db348daa331941935b0c109cb215c7d049d1b07324a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
