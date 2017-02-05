class Packer < Formula
  desc 'A tool for creating identical machine images for multiple platforms from a single source configuration'
  homepage 'https://www.packer.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/packer/0.12.2/packer_0.12.2_darwin_amd64.zip'
  sha256 'eef803cd43adc3b67593fd277f94b14ef266fe7124eb247d620beb29ebb4ec85'
  version '0.12.2'
  def install
    bin.install Dir['*']
  end
end
