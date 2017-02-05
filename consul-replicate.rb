class ConsulReplicate < Formula
  desc 'Consul cross-DC KV replication daemon'
  homepage 'https://github.com/hashicorp/consul-replicate'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul-replicate/0.3.1/consul-replicate_0.3.1_darwin_amd64.zip'
  sha256 'd6e41b1d4355b8a7ae1173a4ffed9f84751b7fbd0f565df8ead6b62725a361f0'
  version '0.3.1'
  def install
    bin.install Dir['*']
  end
end
