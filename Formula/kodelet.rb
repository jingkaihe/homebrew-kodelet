class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.1.15.beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.15.beta/kodelet-darwin-arm64"
      sha256 "4e43294277f282a92de8f504f4f3da4da5335de351861258595f69acb50fc653"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.15.beta/kodelet-darwin-amd64"
      sha256 "4f5f10c83167f739347eba0834ab554fbad2f4e2f2c5e7508597d230d7ff8cb9"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.15.beta/kodelet-linux-arm64"
      sha256 "10d20fdc22d0260b4894e60578b35aef53583ff680cb2b39831c7138cdaf465f"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.1.15.beta/kodelet-linux-amd64"
      sha256 "0ff5e270d8c66e15fa7dcde0bb7a9cda8a180327abb81b1976335f9a9de6bc76"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
