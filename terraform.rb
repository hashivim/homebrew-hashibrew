class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  version '0.6.15'

  url 'https://releases.hashicorp.com/terraform/0.6.15/terraform_0.6.15_darwin_amd64.zip'
  sha256 '9cb305ac00b85e2575da3c71504f3fdd3f7ef61f35457af999c7b88802143311'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
