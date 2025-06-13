# To find the current RAM and Memory usage of my server

# TODO: I need to get the PID of my Java server. Maybe, I can make the
# name of my server an arg instead of hardcoding it here.
read _ pid _ < <(ps aux | grep "java -classpath /Users/sauravspurushothaman/unifize-server/apps/api/test:/Users/sauravspurushothaman/unifize-server/apps/api/src:")

read mem rss < <(ps -p $pid -o %mem,rss | tail -n 1)
declare mb=1024

rss_mb=$((rss / mb))

echo "Memory usage : " $mem "% of total memory"
echo "Ram used: " $rss_mb "Mb"
