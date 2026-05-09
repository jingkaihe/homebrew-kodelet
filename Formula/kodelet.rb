class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.6-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.6-beta/kodelet-darwin-arm64"
      sha256 "b5292595730c6500ba1fd71f5ab1688c7923665fb03bdb13a1c6e4686dfe51c3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.6-beta/kodelet-darwin-amd64"
      sha256 "2f2bf61aa6eec0ced6e2c0b4fe5eaa27eb74973d203a69349ca6669dedac0427"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.6-beta/kodelet-linux-arm64"
      sha256 "7f4708dbcc75f0b16b0b5c7b22ad1d6d120cc5c8b2ddca877d3c5edcc4550c58"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.6-beta/kodelet-linux-amd64"
      sha256 "fbed117808a36ccd9e47812614049bc1cdee947e377529fa6bb2925c3165e111"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
