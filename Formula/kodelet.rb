class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.11.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.11.beta/kodelet-darwin-arm64"
      sha256 "b0156e776eed60177f347eb345e469d5bf271012356184e7982ec2a2245b1a7d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.11.beta/kodelet-darwin-amd64"
      sha256 "089cc40c09f30028079ae4ffe1824f370c5a215657715b9894974b7b71a4f2e6"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.11.beta/kodelet-linux-arm64"
      sha256 "88c56056a901b9ac9d09e294c6ac2bc883d44f581ec81b6a7ff170a37afdc79a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.11.beta/kodelet-linux-amd64"
      sha256 "2c921119d790acb54b4fafd555b2955e5731468d9c0a5f8b097cde359a02e054"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
