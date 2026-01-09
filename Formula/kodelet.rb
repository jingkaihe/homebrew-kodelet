class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.36.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.36.beta/kodelet-darwin-arm64"
      sha256 "66fd4aa45a936ebeb66649d17a99c8a0b8720d62cf64e8338354f426de4feff8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.36.beta/kodelet-darwin-amd64"
      sha256 "d77b783c986b0334ce3acb6463b4d438e765b578b2935920b73d7c154ff07d85"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.36.beta/kodelet-linux-arm64"
      sha256 "b798dae5a178f8718c7769de607de082bc206bd9728bb90468e24b1963551fed"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.36.beta/kodelet-linux-amd64"
      sha256 "fee31e1550908aa835ddb8abfeadb4050b3dbfad6e593e0d9b67fe754b913578"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
