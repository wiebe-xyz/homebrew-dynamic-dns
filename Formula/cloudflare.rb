class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "a34daf9b408603d07ddc04c10b4ed53355b62e5946a11d901c9c8ed20f3c6c04"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "e3c56329f596968d0a0940419c06716fc27f1773c75bcf4556ac0b66f1cfdf8b"
    end
  end

  def install
    bin.install "cloudflare"
  end

  test do
    system "#{bin}/cloudflare", "--help"
  end
end
