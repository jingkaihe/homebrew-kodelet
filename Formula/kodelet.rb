class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.47.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.47.beta/kodelet-darwin-arm64"
      sha256 "8e4e696c667bea10455b288c29114640e96e86cba9a1436dbe16d0274a6ec557"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.47.beta/kodelet-darwin-amd64"
      sha256 "9309b0f8c96dcfea70071ec5e03c989022647b46bb537d37cb23a0557f76067a"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.47.beta/kodelet-linux-arm64"
      sha256 "498051f66fa0ca795f59c171436addf22178906c7af528d7b47f98aac7bde8e8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.47.beta/kodelet-linux-amd64"
      sha256 "fe4066c7a51880ad2e73e51e1c3bcaa335a56b79f20c494956773c501f5cd5a9"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
