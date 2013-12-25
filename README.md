Amazon Price
------------

This is a simple demonstration of how product information could be extracted directly from an Amazon.com page.
To run in on your system, you will need the following prerequisites installed on your system.

1. Ruby 1.9.3 or higher.
2. Phantom JS

    * To install this, run the following command through homebrew:

```
$ brew install phantomjs
```

3. The following ruby gems:
* capybara
* poltergeist

To install them, run the following commands
```
$ gem install capybara
$ gem install poltergeist
```


To run this program, type ```ruby getprice.rb``` from your command line, like this:
```
$ ruby getprice.rb
Enter the ASIN for the product you want to look up.
Examples: B00CMHWTRQ or B0063I7OO8
ASIN: B0097BEFI6
Downloading http://www.amazon.com/dp/B0097BEFI6
{:product_name=>"Apple iPod touch 16GB Black/Silver (5th Generation) NEWEST MODEL", :price=>"$240.06", :sales_rank=>"#58"}
```