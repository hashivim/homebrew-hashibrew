class ConsulTemplate < Formula
  homepage 'https://github.com/hashicorp/consul-template'
  version '0.12.2'

  url 'https://releases.hashicorp.com/consul-template/0.12.2/consul-template_0.12.2_darwin_amd64.zip'
  sha256 'a9ab8e16cb02729153ec72a53f9f9f73efa0259521200467482fb34bd3e893b1'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
