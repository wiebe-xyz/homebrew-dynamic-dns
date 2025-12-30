class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "0fad8f30bb10fedebe60fef8f143e3db7aca46dfb858d3a9ba105f5dcaf6e09d"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "238595afb6eac1fc766dc6caa572b8bd3d7529eef8b57e59d9f87241afa791ef"
    end
  end

  def install
    bin.install "cloudflare"
  end

  test do
    system "#{bin}/cloudflare", "--help"
  end
end
