require 'formula'

class Consul < Formula
  homepage 'http://www.consul.io'
  version '0.6.3'

  url "https://releases.hashicorp.com/consul/#{version}/consul_#{version}_darwin_amd64.zip"
  sha256 '6dff4ffc61d66aacd627a176737b8725624718a9e68cc81460a3df9b241c7932'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
