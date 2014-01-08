# What is this? #

I host several sites statically on Amazon S3. This sucks down the access logs
and converts them into a monthly report. Then, I upload that to a new bucket.

Right now, it's pretty hacky. Someday perhaps I will improve it.

## Dependencies ##

* `s3cmd`
* Perl Geo::IP
* Any other Perl dependencies of AWStats

## To Do ##

* Remove logs from S3 after downloading them.
* Dynamically determine which reports to (re)generate based on which logs were
  downloaded from S3.
* Make the reports less ugly...?
* Generalize to multiple sites.

# Notes #

## Access Control ##

[Only I can see this](http://iangreenleaf-stats.s3-website-us-east-1.amazonaws.com/).

I've restricted access to my results bucket by IP address. To change, edit the
bucket policy and update the IP restriction. The policy should look like this:

```json
{
  "Version": "2012-10-17",
    "Statement": [
    {
      "Sid": "AddPerm",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "s3:GetObject"
        ],
      "Resource": [
        "arn:aws:s3:::iangreenleaf-stats/*"
        ],
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": [
            "70.179.8.127"
            ]
        }
      }
    }
  ]
}
```
