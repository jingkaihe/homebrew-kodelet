class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.16-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.16-beta/kodelet-darwin-arm64"
      sha256 "698bfa96bae37f8950c82fa04b094197e56ba33f852ad8a02bb611267f383fb4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.16-beta/kodelet-darwin-amd64"
      sha256 "3b067770135e10e6c53446541a0c691b3aa2a5441b50327f7b1243e9c6bed52c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.16-beta/kodelet-linux-arm64"
      sha256 "f4eb90a0b8131f03ff67fcc83e45ec13ddeefeb3c04f454cbea1f4b1a8a43039"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.16-beta/kodelet-linux-amd64"
      sha256 "3459058f800cdaebe3b5b9466db45565c1d060f63e9c5d2f64fb231f25364653"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
