class Envconsul < Formula
  desc 'Read and set environmental variables for processes from Consul'
  homepage 'https://github.com/hashicorp/envconsul'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/envconsul/0.6.1/envconsul_0.6.1_darwin_amd64.zip'
  sha256 'bf35ecec47a6034cf7507150ed854e2d9425e588807d783ebfb53f83a5e5142b'
  version '0.6.1'
  def install
    bin.install Dir['*']
  end
end
