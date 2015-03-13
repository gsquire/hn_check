require 'json'
require 'net/http'

# For each hit that we got, print out the corresponding HN URL
# that has the URL we searched against in it. It will also print
# the time at which it was created as a submission.
def print_hits(hits_arr)
    story_url = 'https://news.ycombinator.com/item?id='

    hits_arr.each do |hit|
        print 'found a match at ' + story_url + hit['objectID']
        puts ' created at ' + hit['created_at']
    end
end

# Using the HN search API to search for specifc URLs at the command
# line.
def search(search_url)
    params = { :restrictSearchableAttributes => 'url', :query => search_url }
    hn_search_url = URI('http://hn.algolia.com/api/v1/search')
    hn_search_url.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(hn_search_url)

    if response.is_a?(Net::HTTPSuccess)
        results = JSON.parse(response.body)
        hits = results['hits']

        if hits.length() > 0
            print_hits(hits)
        else
            puts 'could not find a match, you are probably good!'
        end
    else
        # Could not make the request, print out the error.
        response.value()
    end
end

def main
    if ARGV.length() < 1
        puts 'Must supply a URL to search against'
        exit
    else
        search(ARGV[0])
    end
end

main()
