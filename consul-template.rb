class ConsulTemplate < Formula
  desc 'Generic template rendering and notifications with Consul'
  homepage 'https://github.com/hashicorp/consul-template'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul-template/0.18.0/consul-template_0.18.0_darwin_amd64.zip'
  sha256 '6bddfcfcbd495260d05389359b27d71f89154bbc3fc90037faf7428d78a6f765'
  version '0.18.0'
  def install
    bin.install Dir['*']
  end
end
