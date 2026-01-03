class Whatismyip < Formula
  desc "Simple utility to get your current public IP address"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/whatismyip-darwin-amd64.tar.gz"
      sha256 "b82fab73a6cf8c7eab4b6cf991bee75586b34de98c21436bac08a0205461fec2"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/whatismyip-darwin-arm64.tar.gz"
      sha256 "38d539b83b4194093da8af62cf11811432d2e0b0a768b56669f3f2b00891ebd2"
    end
  end

  def install
    bin.install "whatismyip"
  end

  test do
    system "#{bin}/whatismyip"
  end
end
