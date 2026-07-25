class Cloudflare < Formula
  desc "Cloudflare Dynamic DNS updater - Automatically updates DNS A records"
  homepage "https://github.com/wiebe-xyz/dynamic-dns"
  version "0.0.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://webwiebe.nl/brew/cloudflare-darwin-amd64.tar.gz"
      sha256 "cc2b592f642e3c476a499c5392c18ed656eb2255afd910413c252021a49ba028"
    elsif Hardware::CPU.arm?
      url "https://webwiebe.nl/brew/cloudflare-darwin-arm64.tar.gz"
      sha256 "c66873827924768c1dda86b95334b155583e4000d69e83278951f7ef9c1ed095"
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
