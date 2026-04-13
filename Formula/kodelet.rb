class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.38-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.38-beta/kodelet-darwin-arm64"
      sha256 "116f2ed4cf27be92a2de851b76a3787a1c6d6c5a68d335b1f119a1ef52267eab"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.38-beta/kodelet-darwin-amd64"
      sha256 "70ff8214eda0c8e7b16acd89a535932ae1ea8e2d54d46ba54420556cda05041d"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.38-beta/kodelet-linux-arm64"
      sha256 "352a3672e9e3cea5ec4feaafd36754dc39509a15baf4e2f454efaeae37ef1f21"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.38-beta/kodelet-linux-amd64"
      sha256 "98552ede8e184b7bfb31c13238be78e031600c3fed865d6d59e82ef7ea627c40"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
