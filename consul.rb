require 'formula'

class Consul < Formula
  homepage 'https://www.consul.io'
  version '0.6.3'

  url 'https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_darwin_amd64.zip'
  sha256 '6dff4ffc61d66aacd627a176737b8725624718a9e68cc81460a3df9b241c7932'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
