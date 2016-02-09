require 'active_support/inflector'
require 'erb'
require 'open-uri'
require 'nokogiri'

def formula(name, homepage)
  puts "Generating #{name}.rb"

  @name = name
  @homepage = homepage

  index = Nokogiri::HTML(open("https://releases.hashicorp.com/#{name}/"))
  slug = index.xpath('//html/body/ul/li')[1].children[1].attributes['href'].to_s
  @version = slug.split('/')[2]

  sha256sums_url = "https://releases.hashicorp.com/#{name}/#{@version}/#{name}_#{@version}_SHA256SUMS"
  sha256sums = open(sha256sums_url).readlines
  @sha256sum, _filename = sha256sums.find { |x| /darwin_amd64/.match(x) }.split('  ')

  template = File.open('template.erb').read
  File.open("#{name}.rb", 'w') do |f|
    f.puts ERB.new(template).result
  end
end

task :consul do
  formula('consul', 'http://www.consul.io')
end

task :consul_template do
  formula('consul-template', 'https://github.com/hashicorp/consul-template')
end

task :nomad do
  formula('nomad', 'http://www.nomadproject.io')
end

task :otto do
  formula('otto', 'http://www.ottoproject.io')
end

task :packer do
  formula('packer', 'http://www.packer.io')
end

task :serf do
  formula('serf', 'http://www.serfdom.io')
end

task :terraform do
  formula('terraform', 'http://www.terraform.io')
end

task :vault do
  formula('vault', 'http://www.vaultproject.io')
end

task default: [
  :consul,
  :consul_template,
  :nomad,
  :otto,
  :packer,
  :serf,
  :terraform,
  :vault
]
