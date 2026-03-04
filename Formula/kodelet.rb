class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.32.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.32.beta/kodelet-darwin-arm64"
      sha256 "07f1cd8741e587220408aac491adb81e2df1b8e366c3a7de309bdb8794917422"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.32.beta/kodelet-darwin-amd64"
      sha256 "855e53c6f49259d31bcbaeed73827c8b2aee7c88a6a4545543c61cd850b7361c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.32.beta/kodelet-linux-arm64"
      sha256 "6c22aaf2c78871f676fb68a433ec6002c173645e264bba405bcf80dfb4ce2ec6"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.32.beta/kodelet-linux-amd64"
      sha256 "d54d6dc5db3973bc88e32c7c9cb0e7d852b2061c17ebebc9e83f4c6793d2f92a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
