class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.50.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.50.beta/kodelet-darwin-arm64"
      sha256 "a73389a8fb5bb86784f33b997f927fe30105166fcf61696a036ae505a7a9f424"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.50.beta/kodelet-darwin-amd64"
      sha256 "ec84984ef012100a39eeadfb02e7bc03500ed0ddd7b5ae40d3b6981fde6fdf04"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.50.beta/kodelet-linux-arm64"
      sha256 "0fa2ab10f0de374e66fc0566ce864105f7776f2c2aae46406aee2358ca79aa51"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.50.beta/kodelet-linux-amd64"
      sha256 "8c2c1d62839b21a1859cfb1c23aa955720aeb4d525ce6d687fd33be87adaedad"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
