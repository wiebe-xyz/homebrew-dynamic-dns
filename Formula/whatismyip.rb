class Whatismyip < Formula
  desc "Simple utility to get your current public IP address"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/whatismyip-darwin-amd64.tar.gz"
      sha256 "a6bad8d304de813bb306568caab2bbb4a4a652b509e3652694ba954faaed835a"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/whatismyip-darwin-arm64.tar.gz"
      sha256 "dc17c0777a328f30201dc898b71a44439752cd26f3fa2583d1ff10f9abd04e98"
    end
  end

  def install
    bin.install "whatismyip"
  end

  test do
    system "#{bin}/whatismyip"
  end
end
