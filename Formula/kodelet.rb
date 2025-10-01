class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.5.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.5.beta/kodelet-darwin-arm64"
      sha256 "675f5c7f3511241b233beb440160cf9514a3a8cc2d5541d652ed542a814a7e1b"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.5.beta/kodelet-darwin-amd64"
      sha256 "86181b52e4c121275f49ee11b65b07969241ed991868371608c68542d5e7800c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.5.beta/kodelet-linux-arm64"
      sha256 "779e52ac955ff6e2e9efdef8272efad230a7d41f74d1b66be70a5f7cbcb127b0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.5.beta/kodelet-linux-amd64"
      sha256 "051a9042918b770936550e9c227b34f99de9b24527a7c7cfe140c9d348a17beb"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
