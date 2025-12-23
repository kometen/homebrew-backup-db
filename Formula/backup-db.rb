class BackupDb < Formula
  desc "Read secrets from Azure Key Vault and backup a PostgreSQL database"
  homepage "https://github.com/kometen/backup-db"
  url "https://github.com/kometen/backup-db/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "19b46fd1a90645f400ee80b09f425e5fbae35a2c5efad215ba260f94c424323f"
  license "MIT"

  bottle do
    root_url "https://github.com/kometen/homebrew-backup-db/releases/download/backup-db-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5d60c218d070fba4522e51fb05acb044c03208d1c919c52429c84f101607ab9a"
    sha256 cellar: :any_skip_relocation, ventura:       "7fea65794ac2359a1f0464dbdeb12e496a5f693f7eb76256d63bd4150683b035"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8bcfb1a17e6395e8dc09f133f8d41bb530b302e6d40a422fc12959bcd98ec01e"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"

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
