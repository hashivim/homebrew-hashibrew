require 'formula'

class Packer < Formula
  homepage 'http://www.packer.io'
  version '0.8.6'

  url 'https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_darwin_amd64.zip'
  sha256 '91b5e5d4524a7a2f09a07aad1c8e26e1200b47191a42c1b2facac4a27fd674d0'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
