class Vault < Formula
  desc 'A tool for managing secrets'
  homepage 'https://www.vaultproject.io'
  version '0.5.2'

  url 'https://releases.hashicorp.com/vault/0.5.2/vault_0.5.2_darwin_amd64.zip'
  sha256 '48bf1d66cc3b81293186fd458f63fc2b02344aec5f1490c9b9a2915831c13d33'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
