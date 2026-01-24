class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.1.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.1.beta/kodelet-darwin-arm64"
      sha256 "8142cd5f799c171de584f3d4806ff4edaadc88fbf256eeb18024d2b9d817d4fa"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.1.beta/kodelet-darwin-amd64"
      sha256 "7952b0d24ca7e72a18f32b91fa0d28c69b8c5ac3c2d850deb0cd211894de0c3a"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.1.beta/kodelet-linux-arm64"
      sha256 "9465415e7cdddeea668c44e2fa381f24706da4133d2110fc63722a2216def1d1"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.1.beta/kodelet-linux-amd64"
      sha256 "f1f6dd34a3b2d865846bb6e9c139d01aaf8ab811ca4564f4e4abcfa959355f67"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
