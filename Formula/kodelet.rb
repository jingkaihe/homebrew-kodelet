class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.0-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.0-beta/kodelet-darwin-arm64"
      sha256 "8298b618714c1d243c32d6a4abfe9418a7cb4bc47737b39aa02bd892c19124fa"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.0-beta/kodelet-darwin-amd64"
      sha256 "11f041d26bf1374ef74c78b24ae6c5ebb32ec1ed4db00861fb41d7cc34eb6add"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.0-beta/kodelet-linux-arm64"
      sha256 "d149ede9d3a919dac7892f23f232384296d521bc3f49ffcfc59417886b5332c0"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.0-beta/kodelet-linux-amd64"
      sha256 "571ba1b9d3c649784d9e5db2753a9d945fda427cdf424384338b5f24806401f3"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
