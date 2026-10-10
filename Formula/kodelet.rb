class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.8.1-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.1-beta/kodelet-darwin-arm64"
      sha256 "9371ec6021ec02558d674fa9a5571d839903016d8468b68a6207c18e8c36c095"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.1-beta/kodelet-darwin-amd64"
      sha256 "a64cb743241880860f1a026754a525d47b01b686d461bbe940a2dc53f713e2d3"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.1-beta/kodelet-linux-arm64"
      sha256 "52058ca4645a78994b07e42cc7b48d40012346a1da21166f4f8d3eaeadf469c8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.8.1-beta/kodelet-linux-amd64"
      sha256 "4fe45d209f779b38d64b445fc6f4bde847146634d8f2fb999c5003602e4d6f7d"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
