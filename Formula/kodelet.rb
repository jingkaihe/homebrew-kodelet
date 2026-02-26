class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.2.27.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.27.beta/kodelet-darwin-arm64"
      sha256 "4f3f25be0dbc89a8313d781ba4272e17c5f1c6758018fdaf5f32f938304ea0d3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.27.beta/kodelet-darwin-amd64"
      sha256 "c8436287699ef942bb0a6882b224a8b955443df1087ad640caffdbd3a0e21877"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.27.beta/kodelet-linux-arm64"
      sha256 "f16450fa4667d3e777aa97979bcfc10c77d7f4365b358c281edec02bdbd19d40"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.2.27.beta/kodelet-linux-amd64"
      sha256 "502395b655d504e827a6705d63673c88a5e9fce926732805d2be7f56f22698b3"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
