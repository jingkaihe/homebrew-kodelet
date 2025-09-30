class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.2.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.2.beta/kodelet-darwin-arm64"
      sha256 "06c49f9eb80b4027f148cd582d079c89a2618b00a85eb8dcc4b72de70d28a683"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.2.beta/kodelet-darwin-amd64"
      sha256 "8c9d53e10caa6216efa1d81f7901e30ca87ad81cd66e88da70d685dfb9754bb7"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.2.beta/kodelet-linux-arm64"
      sha256 "216986af5f02e311c577370e274d26383f4312f539e0249a1f3213fd383fec4c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.2.beta/kodelet-linux-amd64"
      sha256 "8aeec0ebd6cc9c5a967b17cb0c558c35d82eb0f846000512f0ffaa482a5e224a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
