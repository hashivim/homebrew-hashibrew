class Consul < Formula
  desc 'A tool for service discovery, monitoring and configuration'
  homepage 'https://www.consul.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_darwin_amd64.zip'
  sha256 '9b3a199779a0d9b92266fae2abd7ed91c18ba437eba46e76114cd1940b3b7741'
  version '0.7.1'
  def install
    bin.install Dir['*']
  end
end
