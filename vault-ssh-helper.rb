class VaultSshHelper < Formula
  desc 'Vault SSH Agent is used to enable one time keys and passwords'
  homepage 'https://github.com/hashicorp/vault-ssh-helper'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/vault-ssh-helper/0.1.1/vault-ssh-helper_0.1.1_darwin_amd64.zip'
  sha256 'ab064aec6559bce9dd24799587b9262c7b0927091d174aa4cd1804a7f4a6d868'
  version '0.1.1'
  def install
    bin.install Dir['*']
  end
  def caveats
    <<-EOS.undent
      Hashicorp no longer offers vault-ssh-helper for macOS. This formula installs
      version 0.1.1, which was the last version offered for macOS.
    EOS
  end
end
