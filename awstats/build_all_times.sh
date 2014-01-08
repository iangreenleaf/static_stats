#!/bin/bash

echo "<html><head><title>Statstravaganza</title></head><body>" > ./output/index.html
for year in 2013 2014; do
  echo "<h1>$year</h1><ol>" >> ./output/index.html
  ./awstats_buildstaticpages.pl -config=s3 -output -staticlinks -dir=./output -awstatsprog=./awstats.pl -month=all -year=$year -staticlinksext=$year.html
  echo "<li><a href='awstats.s3.alldomains.$year.html'>Whole Year</a></li>" >> ./output/index.html
  for month in `seq 1 12`; do
    ./awstats_buildstaticpages.pl -config=s3 -output -staticlinks -dir=./output -awstatsprog=./awstats.pl -month=$month -year=$year -staticlinksext=$year-$month.html
    echo "<li><a href='awstats.s3.$year-$month.html'>$month</a></li>" >> ./output/index.html
  done
  echo "</ol>" >> ./output/index.html
done
echo "</body></html>" >> ./output/index.html
