class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.26.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.26.beta/kodelet-darwin-arm64"
      sha256 "e4cd91d9bfb13c2113fa172eb70b6eab513ae8173fc9babf871e9f1a36008631"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.26.beta/kodelet-darwin-amd64"
      sha256 "2bf6f59849ad5b1731501648190babf1a546ba3e1504596d0be35a37541d2945"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.26.beta/kodelet-linux-arm64"
      sha256 "308821132ff8cec7c4101c2c5aef9d00a788067715ef5860c6c02bc02cce2ba8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.26.beta/kodelet-linux-amd64"
      sha256 "a000cf6e4ab9685c3bb236394d4c20311c0a5422c7d78414a8d1b5c5dbaf728a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
