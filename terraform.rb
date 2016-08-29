class Terraform < Formula
  desc 'A tool for building, changing, and combining infrastructure safely and efficiently'
  homepage 'https://www.terraform.io'
  depends_on :arch => :x86_64
  url 'https://releases.hashicorp.com/terraform/0.7.2/terraform_0.7.2_darwin_amd64.zip'
  sha256 '2a441124efd097007414545714927a9239980a5b0707384b0ee07badbae781cf'
  version '0.7.2'
  def install
    bin.install Dir['*']
  end
end
