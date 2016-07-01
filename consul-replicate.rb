class ConsulReplicate < Formula
  desc 'Consul cross-DC KV replication daemon'
  homepage 'https://github.com/hashicorp/consul-replicate'
  depends_on :arch => :x86_64
  stable do
    url 'https://releases.hashicorp.com/consul-replicate/0.2.0/consul-replicate_0.2.0_darwin_amd64.zip'
    sha256 '48956988c2f3d963930f48f26fe16c3dee9eede8719de002940f18802195c190'
    version '0.2.0'
  end
  def install
    bin.install Dir['*']
  end
end
