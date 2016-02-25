class Terraform < Formula
  homepage 'https://www.terraform.io'
  version '0.6.12'

  url 'https://releases.hashicorp.com/terraform/0.6.12/terraform_0.6.12_darwin_amd64.zip'
  sha256 'eaa50e05a88ef83a9ba18a3768932f4d530ce1b710b29ae29992f94addac0bfb'

  depends_on :arch => :x86_64

  def install
    bin.install Dir['*']
  end
end
