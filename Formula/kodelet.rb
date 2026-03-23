class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.17-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.17-beta/kodelet-darwin-arm64"
      sha256 "c83bd41e9175094ecfebd3fb1679a1281bc24cdc924dcbc5e11c589a827fd7ff"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.17-beta/kodelet-darwin-amd64"
      sha256 "144bcc362b4aa5f847823c0a2cff763cd6bca667e42e1094c471fc0478967c30"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.17-beta/kodelet-linux-arm64"
      sha256 "ddb7262fca155feba9a8f6432446f28738290fcf80a37a5bb1d171c46d7a4c23"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.17-beta/kodelet-linux-amd64"
      sha256 "d4080ab8a158b84712fef937a212175526ad7581e0f17cd371c456569721560a"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
