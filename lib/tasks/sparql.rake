require 'net/http'

namespace :sparql do
  desc 'Check connection to sparql endpoint'
  task check: :environment do
    url = URI.parse SemanticCMS.sparql.host
    req = Net::HTTP.new url.host, url.port
    res = req.request_head url.path
    result = {sparql: {url: SemanticCMS.sparql.host, port: url.port, code: res.code}}
    File.open('./config/sparql.yml', 'w') { |file| file.write result.to_yaml }
  end
end
