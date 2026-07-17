class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.1-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.1-beta/kodelet-darwin-arm64"
      sha256 "9c4232b55ce993827c44bfd3359c5c93676f519c9c61c1dad894b4b26a53c9c0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.1-beta/kodelet-darwin-amd64"
      sha256 "2474f5a8766539df148a61dcae0337e19b5793ab99079c30d81448fb6779ebd7"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.1-beta/kodelet-linux-arm64"
      sha256 "e10008e88f35f353a65a6eb86f4242b6fd3b659fbfb865af54a470f8ee7a415a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.1-beta/kodelet-linux-amd64"
      sha256 "fdb05a4ed1e85144cbcf97a15c9b9490bbb911a599bd6d0d8fe0ea50f03e0ee7"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
