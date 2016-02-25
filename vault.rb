class Vault < Formula
  homepage 'https://www.vaultproject.io'
  version '0.5.1'

  url 'https://releases.hashicorp.com/vault/0.5.1/vault_0.5.1_darwin_amd64.zip'
  sha256 '0466e5a0bfe777586ce4c9b3dfa9f48bbc6e902550aefbb2281725a3bd46179c'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
