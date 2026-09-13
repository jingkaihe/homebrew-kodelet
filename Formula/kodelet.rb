class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.12-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.12-beta/kodelet-darwin-arm64"
      sha256 "7c8ab9d0b18b3997e0ecb2763268d19aba9795aed79122f9792ab09ba87957d7"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.12-beta/kodelet-darwin-amd64"
      sha256 "5719422926e69a255e233d427ae02eabcc5346b2b8a3c308e80f26653e4fd00d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.12-beta/kodelet-linux-arm64"
      sha256 "b4787a2bcbf453dc058588b50a6c763395c9937af21359b9b49aaf10adcae59c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.12-beta/kodelet-linux-amd64"
      sha256 "5766a7fafdf729be6cad701b5db036321762512fe728ece35aaa9f35de41676b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
