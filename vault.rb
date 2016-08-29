class Vault < Formula
  desc 'A tool for managing secrets'
  homepage 'https://www.vaultproject.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/vault/0.6.1/vault_0.6.1_darwin_amd64.zip'
  sha256 'a2daa1f8669899296c193347664f97e4acec97d298ebac489b60a03dae8aca4d'
  version '0.6.1'
  def install
    bin.install Dir['*']
  end
end
