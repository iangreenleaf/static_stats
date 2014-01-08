build:
	rm awstats/tmp/technotes.log
	cd raw_logs/technotes/ && ls | xargs -n 32 cat >> ../../awstats/tmp/technotes.log && cd ../..
	cd awstats && ./awstats.pl -config=s3 -update
	cd awstats && ./awstats_buildstaticpages.pl -config=s3 -output -staticlinks -dir=./output -awstatsprog=./awstats.pl -month=12 -year=2013

sync:
	s3cmd sync s3://iangreenleaf-logs/ raw_logs/
