build:
	rm awstats/tmp/technotes.log
	cd raw_logs/technotes/ && ls | xargs -n 32 cat >> ../../awstats/tmp/technotes.log && cd ../..
	cd awstats && ./awstats.pl -config=s3 -update
	cd awstats && ./build_all_times.sh

sync:
	s3cmd sync s3://iangreenleaf-logs/ raw_logs/

publish:
	s3cmd sync awstats/output/ s3://iangreenleaf-stats/
