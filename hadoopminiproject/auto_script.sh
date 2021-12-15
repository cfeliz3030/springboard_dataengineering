
bin/hadoop jar /Users/christopher/Desktop/myhadoop/hadoop-3.3.1/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file /Users/christopher/Desktop/hadoopminiproject/mapper1.py -mapper "python3 mapper1.py" \
-file /Users/christopher/Desktop/hadoopminiproject/reducer1.py -reducer "python3 reducer1.py" \
-input /hadoopminiproject/hadoopminiproject/data.csv -output /hadoopminiproject/hadoopminiproject/stepone


bin/hadoop jar /Users/christopher/Desktop/myhadoop/hadoop-3.3.1/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file /Users/christopher/Desktop/hadoopminiproject/mapper2.py -mapper "python3 mapper2.py" \
-file /Users/christopher/Desktop/hadoopminiproject/reducer2.py -reducer "python3 reducer2.py" \
-input /hadoopminiproject/hadoopminiproject/stepone -output /hadoopminiproject/hadoopminiproject/steptwo
