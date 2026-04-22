class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.46-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.46-beta/kodelet-darwin-arm64"
      sha256 "6b48d55e0b3c2ca0b00817a0755d4c9325c76a0b764186998ccb72150628e6c5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.46-beta/kodelet-darwin-amd64"
      sha256 "d8ad7ef2fe594248006069f57de81713a2d7c8ca36ba5613b46f59f75ce4b3b0"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.46-beta/kodelet-linux-arm64"
      sha256 "5f35dac9596fd13a1970bf869d3dd2fdb1b5c4cc6d72be1c446b66e95fa20738"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.46-beta/kodelet-linux-amd64"
      sha256 "d6f52bc7e18fb101b37d0176c8572d2174f05e276464321853b1ef38d463bbb7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
