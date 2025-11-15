class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.16.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.16.beta/kodelet-darwin-arm64"
      sha256 "65ff5275c0cdb035dc54b12e1c0c4d593cfe5b079d92fc1cd13ff029490d4194"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.16.beta/kodelet-darwin-amd64"
      sha256 "7ba65acb396867423e68173266a5bcfe152ad36ebbfb4bb8b2a153fc6e1faab8"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.16.beta/kodelet-linux-arm64"
      sha256 "a5807f21a5799ff46e929de730a3ed3bd0b8d828ebcd6225a23a1beff22dbca3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.16.beta/kodelet-linux-amd64"
      sha256 "11d9cc4b30c82f985313ee82f45dfb7d896ca4d4fcef875b5f4f43f1fe2ee9a2"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
