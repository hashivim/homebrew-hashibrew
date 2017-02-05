class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/terraform/0.8.5/terraform_0.8.5_darwin_amd64.zip'
  sha256 '10253ac843b7a170844d629cbdbd2287bf687cdd3d2938e4ab9140d10534cf38'
  version '0.8.5'
  def install
    bin.install Dir['*']
  end
end
