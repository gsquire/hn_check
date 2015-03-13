# hn_check
A simple Ruby script to check if a URL has been submitted to HN.

It uses the HN Search API provided by Algolia. The documentation for the API
can be found [here](https://hn.algolia.com/api).

To run the script:
```sh
ruby hn_check.rb URL
```

URL is the single URL you wish to check to see if it has been submitted to HN.
The search is restricted to URL matching only. The URL is properly encoded and
does not need to be quoted.

This script was created for others to check against duplicate submissions on
HN. 

**Enjoy!**
