class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.13-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.13-beta/kodelet-darwin-arm64"
      sha256 "8cbb44fa26487b578be1dcaf05e8d5b76b525a525b9ceb5b43beeb12f05bc296"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.13-beta/kodelet-darwin-amd64"
      sha256 "acce7297dba99d48bf280d250845ceee8a868efb9a953ee35bf64ac2661e3e3c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.13-beta/kodelet-linux-arm64"
      sha256 "f71a9637f3d4d3c7472bff8aa400b5ead8688551ab862552357888fb5a60e105"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.13-beta/kodelet-linux-amd64"
      sha256 "0bbfc06ee85856027b1bb1ebfad42212faa8c403a27b0e5a3ebfa91fc907a846"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
