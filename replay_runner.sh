trap "echo Exited!; exit;" SIGINT SIGTERM
while [[ 1=1 ]]
do
	watch --chgexit -n 5 "ls -Ral --full-time ../pokemon-showdown/logs/ | sha256sum" && python3 generate_replays.py && python3 generate_csv.py
	sleep 5
done
