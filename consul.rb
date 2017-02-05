class Consul < Formula
  desc 'A tool for service discovery, monitoring and configuration'
  homepage 'https://www.consul.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul/0.7.3/consul_0.7.3_darwin_amd64.zip'
  sha256 '08dd9af590a6c6ecd629e532083bd898b42c6425d08aa9f62b8f090a6dd65826'
  version '0.7.3'
  def install
    bin.install Dir['*']
  end
end
