class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.28-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.28-beta/kodelet-darwin-arm64"
      sha256 "a8c74f7878e2338b17491288552980a6e200851a83d6b009182c920b9d113860"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.28-beta/kodelet-darwin-amd64"
      sha256 "8fe157302f4902d9acdf717114dfc4a5ae0f48ff1ac0ee9a6d492e4ab6b85dd0"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.28-beta/kodelet-linux-arm64"
      sha256 "f852883443faa84a3c1f819d2edfb8a497d2fdf62230d818d3a6567df10620e4"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.28-beta/kodelet-linux-amd64"
      sha256 "ade2d73b77209b25e1365b9e38b546e5e4ea54179805fd2787b1d9f3287f3530"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
