class ConsulTemplate < Formula
  desc 'Generic template rendering and notifications with Consul'
  homepage 'https://github.com/hashicorp/consul-template'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul-template/0.14.0/consul-template_0.14.0_darwin_amd64.zip'
  sha256 '37fc8aca13020180b367bb1d277242adb11526394f4f0ce1c3d5f0ec8d2071d8'
  version '0.14.0'
  def install
    bin.install Dir['*']
  end
end
