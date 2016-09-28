class Packer < Formula
  desc 'A tool for creating identical machine images for multiple platforms from a single source configuration'
  homepage 'https://www.packer.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/packer/0.10.2/packer_0.10.2_darwin_amd64.zip'
  sha256 '2ddd7a5ffe501978f4eaa5c1c5b0443556aaaa6e093b79e0670c8ea833f86d9d'
  version '0.10.2'
  def install
    bin.install Dir['*']
  end
end
