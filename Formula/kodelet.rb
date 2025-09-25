class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.0.100.alpha"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.0.100.alpha/kodelet-darwin-arm64"
      sha256 "01f1b266e94de853c1aba2724cf209cd99ca6e3f636d4d982ec065ee23f9dfd1"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.0.100.alpha/kodelet-darwin-amd64"
      sha256 "020c20094beb34c7a4c6fe5ed0360b1e271927f99c40618a0292e65d5e24b4b4"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.0.100.alpha/kodelet-linux-arm64"
      sha256 "c341d882eb31864c043631c00341a9be24435d6901756b6079c2ee44460bb690"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.0.100.alpha/kodelet-linux-amd64"
      sha256 "c91c74208bcbe33add4b15f027bbed5ac67e078fe3d1c38b3168f17daf4b2773"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
