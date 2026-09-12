class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.6.11-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.11-beta/kodelet-darwin-arm64"
      sha256 "2146013ff43fb26c31d396f0d1b162f72797b3490717cf805fccbd29bb6953d7"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.11-beta/kodelet-darwin-amd64"
      sha256 "e62e8848841591606167d8f23bf85d06de9fcd49d699bf52b4438e490793445d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.11-beta/kodelet-linux-arm64"
      sha256 "7209251e422f9e5e799e2595d059ba901e2380823aa30ebbe923d313317dc249"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.6.11-beta/kodelet-linux-amd64"
      sha256 "9ae00ee0d39156229e7ce398fd41c8fb8a9dbec12e970f3345a4ce4bf47eb126"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
