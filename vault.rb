require 'formula'

class Vault < Formula
  homepage 'http://www.vaultproject.io'
  version '0.5.0-rc2'

  url 'https://releases.hashicorp.com/vault/0.5.0-rc2/vault_0.5.0-rc2_darwin_amd64.zip'
  sha256 '317e6dfdeb9f0ebac25d40d878f5105a98a8071cc9d84681b155b69795eb2e47'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
