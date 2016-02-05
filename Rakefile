require 'erb'
require 'open-uri'
require 'nokogiri'

def formula(name, domain)
  puts "Generating #{name}.rb"

  @name = name
  @domain = domain

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
  formula('consul', 'consul.io')
end

task :nomad do
  formula('nomad', 'nomadproject.io')
end

task :otto do
  formula('otto', 'ottoproject.io')
end

task :packer do
  formula('packer', 'packer.io')
end

task :serf do
  formula('serf', 'serfdom.io')
end

task :terraform do
  formula('terraform', 'terraform.io')
end

task :vault do
  formula('vault', 'vaultproject.io')
end

task :default => [:consul, :nomad, :otto, :packer, :serf, :terraform, :vault]
