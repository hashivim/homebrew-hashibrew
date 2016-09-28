class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/terraform/0.7.4/terraform_0.7.4_darwin_amd64.zip'
  sha256 '21c8ecc161628ecab88f45eba6b5ca1fbf3eb897e8bc951b0fbac4c0ad77fb04'
  version '0.7.4'
  def install
    bin.install Dir['*']
  end
end
