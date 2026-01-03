class Whatismyip < Formula
  desc "Simple utility to get your current public IP address"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/whatismyip-darwin-amd64.tar.gz"
      sha256 "fb3dda469969a687b9ca65dd5404c86ca93e231871a307461babeb83206454db"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/whatismyip-darwin-arm64.tar.gz"
      sha256 "d7b200ba32654cb821718909e8e3b7cc11233871b5357c09c02dbb3683d9e388"
    end
  end

  def install
    bin.install "whatismyip"
  end

  test do
    system "#{bin}/whatismyip"
  end
end
