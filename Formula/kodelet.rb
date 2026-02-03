class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.12.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.12.beta/kodelet-darwin-arm64"
      sha256 "efbac5dd9b2214f4a96223a924cdd162dcbb296d40a1f11c6c25bf6daaa0a02f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.12.beta/kodelet-darwin-amd64"
      sha256 "d09a49f5e0cdb303ae1539d6e128ddbcb3713f4b4847a7b4a01a2717268fc60d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.12.beta/kodelet-linux-arm64"
      sha256 "9115595629f3a3ca3420f5bac8776cfabd81dbdcba9540667aa5c3adc6fe4a98"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.12.beta/kodelet-linux-amd64"
      sha256 "18340c40f6aa9027af514bf52a1bcbbbfd89c78383f544e856a848c199926060"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
