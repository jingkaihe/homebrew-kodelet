class Kodelet < Formula
  desc "Lightweight agentic SWE Agent for software engineering and production operations"
  homepage "https://github.com/jingkaihe/kodelet"
  version "0.4.54-beta"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.54-beta/kodelet-darwin-arm64"
      sha256 "c7fa5933198d890c531f9713c4b8478ab509799f8ae5ccdb36da9fbc5143d7e8"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.54-beta/kodelet-darwin-amd64"
      sha256 "7bb73b35cbf95fc497d2f9471db7732f9da3d6a032b886d429b961e1c01e8950"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.54-beta/kodelet-linux-arm64"
      sha256 "579589e224ba1c3088e0b1872d45c8f6eaabd9da5291b354d5a192b472fbdce3"
    else
      url "https://github.com/jingkaihe/kodelet/releases/download/v0.4.54-beta/kodelet-linux-amd64"
      sha256 "7cf5565567c5dd48ead4f932a0663dbd666a31378b490e69cab979128b0b3d9b"
    end
  end

  def install
    bin.install Dir["kodelet*"].first => "kodelet"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kodelet version")
  end
end
