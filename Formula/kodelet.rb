class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.10-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.10-beta/kodelet-darwin-arm64"
      sha256 "d2f511c18d33bfbce9712b4af3eaf7c98c273b8989c2fa81e7d76ca1dcd5129a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.10-beta/kodelet-darwin-amd64"
      sha256 "21462448796ff334c305bd65a56b503e20f367b943428ca6ec36423781cade82"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.10-beta/kodelet-linux-arm64"
      sha256 "252c73d6d6abfbac74e805583391fe35a4afe68be2bc72b9be3114d7d4ca3567"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.10-beta/kodelet-linux-amd64"
      sha256 "6c4d6ac89b77d2ef379947024cdbba3c80ec9338225c73721e8d4dcdc70f5eba"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
