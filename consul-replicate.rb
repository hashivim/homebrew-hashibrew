class ConsulReplicate < Formula
  desc 'Consul cross-DC KV replication daemon'
  homepage 'https://github.com/hashicorp/consul-replicate'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul-replicate/0.2.0/consul-replicate_0.2.0_darwin_amd64.zip'
  sha256 '4d5c944e33630750b5d73ae7f9fc0510322dd60efa04aaefa939bc0d59e93885'
  version '0.2.0'
  def install
    bin.install Dir['*']
  end
end
