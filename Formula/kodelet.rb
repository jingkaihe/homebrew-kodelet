class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.36-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.36-beta/kodelet-darwin-arm64"
      sha256 "243421465e20b38448e68042e2539c3b7bef010a29b2d6e1a350275002b2d29a"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.36-beta/kodelet-darwin-amd64"
      sha256 "17106eec2aa530e48265541c15f01c85d72a05025675e9fcecec06f4738fd3c1"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.36-beta/kodelet-linux-arm64"
      sha256 "f8dd7a8df704f42460b47b3460716dc3dbc1718e8594543681eb5b6786f929f4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.36-beta/kodelet-linux-amd64"
      sha256 "9ddfb415ca160623989463e4aa27e716aa471bf728f20166f301e533934150e6"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
