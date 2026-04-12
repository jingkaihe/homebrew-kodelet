class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.35-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.35-beta/kodelet-darwin-arm64"
      sha256 "e0bd9f721d0917d1669d97d6cfb3b4165ef5dc54daa03b69853d7c21870b6c6e"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.35-beta/kodelet-darwin-amd64"
      sha256 "09aa338c05d81f32840c4364851dc54e0ea3833dfe3df0b727fc2bfd18cfef7f"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.35-beta/kodelet-linux-arm64"
      sha256 "152485ba68439e3b1c6a5789fe8a1653010b2e48b8c8dfed467d21c4370e4c89"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.35-beta/kodelet-linux-amd64"
      sha256 "08597a502cc700f214237fafc083ef27276555e56025e40893eb825bbfab0be2"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
