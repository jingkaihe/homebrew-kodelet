class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.0-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.0-beta/kodelet-darwin-arm64"
      sha256 "3b9a3171346d7884be12ba1c4a5db4c1092248f1f01b65a7a21258c9d5001524"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.0-beta/kodelet-darwin-amd64"
      sha256 "7a30fc848af70f3d164ed5ae3fc9b676760d415e036c697ec2d4d2db8a7574cd"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.0-beta/kodelet-linux-arm64"
      sha256 "7470706dc973f66c5f929adf5ae0b481f8417f834c299ad05ade79182c572b58"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.0-beta/kodelet-linux-amd64"
      sha256 "3a5efcdf08e66fc2ca3f9d5af926272ef64994487a3dcec511fe4d090c921cc5"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
