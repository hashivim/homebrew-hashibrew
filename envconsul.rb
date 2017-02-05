class Envconsul < Formula
  desc 'Read and set environmental variables for processes from Consul'
  homepage 'https://github.com/hashicorp/envconsul'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/envconsul/0.6.2/envconsul_0.6.2_darwin_amd64.zip'
  sha256 '6714e49c1155d07bace219b1a0cc572777da7f86bc51977d6aeefc0e44f07568'
  version '0.6.2'
  def install
    bin.install Dir['*']
  end
end
