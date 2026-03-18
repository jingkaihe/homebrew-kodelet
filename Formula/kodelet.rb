class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.14-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.14-beta/kodelet-darwin-arm64"
      sha256 "65e685a47534922f8dfba1578993bc33b4615771945f069e2a3b5934795d7966"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.14-beta/kodelet-darwin-amd64"
      sha256 "87b3c4f3e1d37d20d8380b5cea72708026c3aeebcfcd779a0b34d33fb2c20b13"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.14-beta/kodelet-linux-arm64"
      sha256 "f1e50ceed81a7ce3eafabd0defce2f2e8479769eee05a14f2612a6e4b89f3bcf"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.14-beta/kodelet-linux-amd64"
      sha256 "980ab3d72d26c2ce8c18aee218c71d43332ec0c647795d0bfad37ab58db64f63"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
