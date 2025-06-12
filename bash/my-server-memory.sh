# To find the current RAM and Memory usage of my server

read usr pid _ < <(ps aux | grep "java -classpath /Users/sauravspurushothaman/unifize-server/apps/api/test:/Users/sauravspurushothaman/unifize-server/apps/api/src:")

read mem rss < <(ps -p $pid -o %mem,rss | tail -n 1)
declare mb=1024

rss_mb=$((rss / mb))

echo "Memory usage : " $mem "% of total memory"
echo "Ram used: " $rss_mb "Mb"
