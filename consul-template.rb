class ConsulTemplate < Formula
  desc 'Generic template rendering and notifications with Consul'
  homepage 'https://github.com/hashicorp/consul-template'
  depends_on :arch => :x86_64
  stable do
    url 'https://releases.hashicorp.com/consul-template/0.15.0/consul-template_0.15.0_darwin_amd64.zip'
    sha256 '1ecc48bc3c5df7537e4857693322b46dc5db5563b84e8225b24df439e287f9e3'
    version '0.15.0'
  end
  def install
    bin.install Dir['*']
  end
end
