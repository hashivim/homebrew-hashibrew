class Consul < Formula
  homepage 'https://www.consul.io'
  version '0.6.4'

  url 'https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_darwin_amd64.zip'
  sha256 '75422bbd26107cfc5dfa7bbb65c1d8540a5193796b5c6b272d8d70b094b26488'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
