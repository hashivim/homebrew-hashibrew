class VaultSshHelper < Formula
  desc 'Vault SSH Agent is used to enable one time keys and passwords'
  homepage 'https://github.com/hashicorp/vault-ssh-helper'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/vault-ssh-helper/0.1.1/vault-ssh-helper_0.1.1_darwin_amd64.zip'
  sha256 'dab3e62522553a7a00ec3578529f4e4895344b2e07fcfd5fd6b747b322658207'
  version '0.1.1'
  def install
    bin.install Dir['*']
  end
end
