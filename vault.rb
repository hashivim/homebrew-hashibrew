require 'formula'

class Vault < Formula
  homepage 'http://www.vaultproject.io'
  version '0.5.0'

  url 'https://releases.hashicorp.com/vault/0.5.0/vault_0.5.0_darwin_amd64.zip'
  sha256 '1ab8150c91e4b293741d2a6d32085949b92be4d75073392a7ed52d6b55e2b132'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
