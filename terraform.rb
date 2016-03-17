class Terraform < Formula
  homepage 'https://www.terraform.io'
  version '0.6.13'

  url 'https://releases.hashicorp.com/terraform/0.6.13/terraform_0.6.13_darwin_amd64.zip'
  sha256 '5f285ea0bf7f6bd704ef262330f88dc195ffa6ed118490d54961958dfe2dab24'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
