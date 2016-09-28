class Consul < Formula
  desc 'A tool for service discovery, monitoring and configuration'
  homepage 'https://www.consul.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul/0.7.0/consul_0.7.0_darwin_amd64.zip'
  sha256 '74111674527c5be0db7a98600df8290395abdd94e2cd86bda7418d748413396d'
  version '0.7.0'
  def install
    bin.install Dir['*']
  end
end
