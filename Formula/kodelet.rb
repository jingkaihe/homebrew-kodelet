class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.8-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.8-beta/kodelet-darwin-arm64"
      sha256 "09921c50cf4b354177822d81713b9ec8582dd38abad17d7b107c11e5f47be550"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.8-beta/kodelet-darwin-amd64"
      sha256 "daf8fa0926a0384d82e32cd411a0cd1eeeb5ce02c312b28ebb51c54d5116be4b"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.8-beta/kodelet-linux-arm64"
      sha256 "cadb7cc77f1bc0a9ab5da747e60229d6c8415920d15dcf0cdfde5e565ca444f8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.8-beta/kodelet-linux-amd64"
      sha256 "039565e3ecbc2a36cfd65a557f36897e80ab55f51ba1e668b2da8290a465b3c0"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
