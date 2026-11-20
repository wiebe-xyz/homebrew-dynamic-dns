class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "eec7aef1c4c81371a4319cb26cbe17b8e3c9dae7bb1b076c3f21e7fba3622f8d"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "e8000f2f41921842915b900a8cd95a38d767201e7e756ce7ca99d42fa5e6e458"
    end
  end

  def install
    bin.install "cloudflare"
  end

  service do
    run [opt_bin/"cloudflare"]
    run_type :interval
    interval 300
    environment_variables HOME: ENV["HOME"]
    log_path var/"log/cloudflare-ddns.log"
    error_log_path var/"log/cloudflare-ddns.log"
  end

  test do
    system "#{bin}/cloudflare", "--help"
  end
end
