class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.3.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.3.beta/kodelet-darwin-arm64"
      sha256 "580b974d698b76ecf54712b74b7a3a14c0593434db039688c38178690bee03c8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.3.beta/kodelet-darwin-amd64"
      sha256 "324cfdee6a9328bee1f4e8520bb16a229efa17cfcf5342fc8aad6b982fc867e2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.3.beta/kodelet-linux-arm64"
      sha256 "34813f217073426557d01029b1649fb0e9b8ff23a26ee2a4b892349e907161af"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.3.beta/kodelet-linux-amd64"
      sha256 "aade17a4e3e1cadeb0763d175e264d351d336d770b2ed81dc0a35c16f1170b64"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
