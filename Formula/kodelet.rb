class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.7.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.7.beta/kodelet-darwin-arm64"
      sha256 "03432b7909bf8629916a5634a02e9a4453c44bca44f5c808b7796e393c527a8f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.7.beta/kodelet-darwin-amd64"
      sha256 "69b02fade66b317e5712be56f7b5726989a699f5a699bf5be1f1858eead406be"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.7.beta/kodelet-linux-arm64"
      sha256 "31fd63b354dba632669f0494249437053cee782eb666bedf1b7d854fcebd6ae2"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.7.beta/kodelet-linux-amd64"
      sha256 "c96daec7fafcc984e99a2aa36cff09807cc9f61cf3f341c82a10837ce41295de"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
