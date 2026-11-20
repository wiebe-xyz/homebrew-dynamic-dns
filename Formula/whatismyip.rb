class Whatismyip < Formula
  desc "Simple utility to get your current public IP address"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/whatismyip-darwin-amd64.tar.gz"
      sha256 "57add67e2c488c05ea203eb3307cdeb8ea4b99077b824e46e5dd94287c9a41c5"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/whatismyip-darwin-arm64.tar.gz"
      sha256 "abe322d067b972638637376bb190992d7e3ec43ab91e994e9fe34875a515c3fb"
    end
  end

  def install
    bin.install "whatismyip"
  end

  test do
    system "#{bin}/whatismyip"
  end
end
