class Whatismyip < Formula
  desc "Simple utility to get your current public IP address"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/whatismyip-darwin-amd64.tar.gz"
      sha256 "6de844641fb1e1bd14b7488e92f0b3638a7bd2935b9a4c1e5a721d128ca94e6f"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/whatismyip-darwin-arm64.tar.gz"
      sha256 "9253b3897e4c69f40d1f3c9b139f8a7cf50e1f9653da65fdbeff2b44fe347064"
    end
  end

  def install
    bin.install "whatismyip"
  end

  test do
    system "#{bin}/whatismyip"
  end
end
