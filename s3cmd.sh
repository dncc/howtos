# show number of files in the census1 dir
s3cmd ls "s3://job-queries/input/census1/*" | wc -l

# compute total size of the files in census1 dir
s3cmd ls "s3://job-queries/input/census1/*" | awk '{ sum+=$3 } END { print sum }'

# cp from bucket1 to bucket2 with wildcards
s3cmd cp "s3://job-queries/input/census1/*" "s3://job-queries/output/census1/*"

