class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.7.0-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.0-beta/kodelet-darwin-arm64"
      sha256 "e4e2ec82fe9926f8a58db7f59550de26e74da435e8f24dd812898add9c4c86c3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.0-beta/kodelet-darwin-amd64"
      sha256 "1e3a049e86d4239d376e458029b7547b7550cab207e07d8ee507b94ed5248812"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.0-beta/kodelet-linux-arm64"
      sha256 "b69b1e535960b8be7d77b0cc5cdf75d6aa8b357d7e0411d8ec9e32573121837d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.7.0-beta/kodelet-linux-amd64"
      sha256 "5db207010360715f89ea128e40fcad1abf89896756e263351e36bc79faa4e1c2"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
