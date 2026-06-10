class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.34-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.34-beta/kodelet-darwin-arm64"
      sha256 "5df4976901b9fcab02afa38dca57699ea3f3408c54054e563d3b3ef40eddee23"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.34-beta/kodelet-darwin-amd64"
      sha256 "67ef4e8ecd1cd9ac6f563c18d506901be106e9264eebdb6bc796e13f470d413f"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.34-beta/kodelet-linux-arm64"
      sha256 "b422be7465f5f8bb5fbbb24a5a4bfc1fdee0a81d7fed518faacaac94e20ba1b5"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.34-beta/kodelet-linux-amd64"
      sha256 "3a7db955301dd3718aadde733c6fce8077215d4d3edc713d6eba14069e63389b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
