class ConsulTemplate < Formula
  desc 'Generic template rendering and notifications with Consul'
  homepage 'https://github.com/hashicorp/consul-template'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul-template/0.16.0/consul-template_0.16.0_darwin_amd64.zip'
  sha256 '5f932f3601a1b5ff9e205f130635fa62638ea66e335a420457e7df39d95e4796'
  version '0.16.0'
  devel do
    url 'https://releases.hashicorp.com/consul-template/0.18.0-rc1/consul-template_0.18.0-rc1_darwin_amd64.zip'
    sha256 'ec0e99d0f05aee7600a1f290270e49aed240465036ade409430a2eba906e6a85'
    version '0.18.0-rc1'
  end
  def install
    bin.install Dir['*']
  end
end
