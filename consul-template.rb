class ConsulTemplate < Formula
  desc 'Generic template rendering and notifications with Consul'
  homepage 'https://github.com/hashicorp/consul-template'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul-template/0.16.0/consul-template_0.16.0_darwin_amd64.zip'
  sha256 '5f932f3601a1b5ff9e205f130635fa62638ea66e335a420457e7df39d95e4796'
  version '0.16.0'
  def install
    bin.install Dir['*']
  end
end
