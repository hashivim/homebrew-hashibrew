class Packer < Formula
  desc 'A tool for creating identical machine images for multiple platforms from a single source configuration'
  homepage 'https://www.packer.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/packer/0.11.0/packer_0.11.0_darwin_amd64.zip'
  sha256 '5e3c3448f0efc33069ecfeae698eea475b37ebff385db596f6f4621edfd52797'
  version '0.11.0'
  def install
    bin.install Dir['*']
  end
end
