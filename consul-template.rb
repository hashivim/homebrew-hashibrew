class ConsulTemplate < Formula
  homepage 'https://github.com/hashicorp/consul-template'
  version '0.13.0'

  url 'https://releases.hashicorp.com/consul-template/0.13.0/consul-template_0.13.0_darwin_amd64.zip'
  sha256 'ea7ec46b5922f497b5ffea8a7de2eb33268fc7ff18bd20e1a35af9334c98b5b9'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
