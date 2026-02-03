class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.9.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.9.beta/kodelet-darwin-arm64"
      sha256 "46bb51e00a986ea4270fd7a6abd16cc2ec76a8d9b54b9c3276d1c32814fcb100"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.9.beta/kodelet-darwin-amd64"
      sha256 "5a6c7aea9e2993ea1406144cb95ac0a6c0a28f57d54fb080575ddf75ed667c58"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.9.beta/kodelet-linux-arm64"
      sha256 "fcfbe31a9d977373dc4125ca613cd3d830b6e286a9b36faec69813505b2c3295"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.9.beta/kodelet-linux-amd64"
      sha256 "5ced640c967e99f3e647386bfb031b36ed35080b778ee20ea3ca495b13b09f63"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
