class BackupDb < Formula
  desc "Read secrets from Azure Key Vault and backup a PostgreSQL database"
  homepage "https://github.com/kometen/backup-db"
  url "https://github.com/kometen/backup-db/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5635249ad9f8d5cdbd493fb4fdc94663cabb1fc1f0b98a6e4a5b0bd4c2095765"
  license "MIT"

  bottle do
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    # Install binary
    bin.install "target/release/backup_db"
  end

  test do
    output = shell_output("#{opt_bin}/backup_db --help | /usr/bin/head -1 | tr -d '\n' 2>&1")
    expected = "Usage: backup_db --namespace <NAMESPACE>"
    assert_match expected, output

    assert_match version.to_s, shell_output("#{opt_bin}/backup_db --version")
  end
end
