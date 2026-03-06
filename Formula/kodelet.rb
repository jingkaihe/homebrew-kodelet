class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.3.1.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.1.beta/kodelet-darwin-arm64"
      sha256 "bb3f71f5e7ddc0120cb3e28c77908e271c0a827c73d8cc17b001dbe018649830"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.1.beta/kodelet-darwin-amd64"
      sha256 "47f8a0311bef030929a457b5c763182639e2b72a8a4b407bd51b2d7fa617336c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.1.beta/kodelet-linux-arm64"
      sha256 "1ac16cad23a4e513511c33622061260ac7be36646e802f8eece942d1bef0934d"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.3.1.beta/kodelet-linux-amd64"
      sha256 "b1dd22169ae71a522979651696d5f13d7024c09e20fbc567cc5db84263f28ba0"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
