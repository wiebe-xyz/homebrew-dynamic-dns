class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "f48bdff722a12c8279ec680a17c337f6f1c9d2685036feb2b5289838bb89647e"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "1de13f37d10a4cdf7b56db96654c8be3b51a8ce0fcd13c7e65bfb81a34e41b6a"
    end
  end

  def install
    bin.install "cloudflare"
  end

  test do
    system "#{bin}/cloudflare", "--help"
  end
end
