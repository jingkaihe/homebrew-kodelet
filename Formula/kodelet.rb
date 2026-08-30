class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.5.41-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.41-beta/kodelet-darwin-arm64"
      sha256 "d07b93100bf4965a2082bcb9a189f68fe0bf19f02a1c2f598846c63b3cfe69aa"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.41-beta/kodelet-darwin-amd64"
      sha256 "8c7c7766b204ebef76a5975406a897cc214761853b560eca886ef844f32be275"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.41-beta/kodelet-linux-arm64"
      sha256 "8d279bb76ee5777ada47c7686a4129aa776f6d3eb3cdcf8e42d0faa30d16bbbf"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.5.41-beta/kodelet-linux-amd64"
      sha256 "e1e7babed49d741fa5949e7fc0f92bc9d76651093fdfafb9dfe5c6058e741a2d"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
