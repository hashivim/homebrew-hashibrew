class Envconsul < Formula
  desc 'Read and set environmental variables for processes from Consul'
  homepage 'https://github.com/hashicorp/envconsul'
  version '0.6.1'

  url 'https://releases.hashicorp.com/envconsul/0.6.1/envconsul_0.6.1_darwin_amd64.zip'
  sha256 '86eb25aef204bbf8c1b61737431c1f8df585c30becaceabcc3eda7cf283ed203'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
