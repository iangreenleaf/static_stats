#!/bin/bash

for year in 2013 2014; do
  ./awstats_buildstaticpages.pl -config=s3 -output -staticlinks -dir=./output -awstatsprog=./awstats.pl -month=all -year=$year -staticlinksext=$year.html
  for month in `seq 1 12`; do
    ./awstats_buildstaticpages.pl -config=s3 -output -staticlinks -dir=./output -awstatsprog=./awstats.pl -month=$month -year=$year -staticlinksext=$year-$month.html
  done
done
