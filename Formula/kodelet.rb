class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.12.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.12.beta/kodelet-darwin-arm64"
      sha256 "62bee4d00c346f1261b9ceb85ac897e0973b8803fb211617de9d2a6477fb6d28"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.12.beta/kodelet-darwin-amd64"
      sha256 "f6c579f94779480f74185ec69e82c19bc2a9da4073c5443103f46770207dca81"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.12.beta/kodelet-linux-arm64"
      sha256 "3295608d9c59ac5c0e0e0556cae14013eb1f3426e216ff395578329f47f9f25c"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.12.beta/kodelet-linux-amd64"
      sha256 "b2f6a23a1694548deb8f50c31f43757192e126ff6c5259f47693e00fce5fc9ba"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
