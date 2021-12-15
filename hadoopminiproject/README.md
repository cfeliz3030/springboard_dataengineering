## Hadoop Mini Project
### Post-Sale Automobile Report

In this project we will build a mapreduce script which reads data from a csv file and outputs a count of accidents per car make/year.

The data we will be working with can be seen below. \
<img width="616" alt="Screen Shot 2021-12-15 at 12 04 51 PM" src="https://user-images.githubusercontent.com/60493376/146257287-b9723686-5685-4e15-8a17-eb424af92691.png">

### Step-by-Step Instructions:
Step 1. Install Hadoop 3.3.1 \
Intallation Video: https://www.youtube.com/watch?v=BdHQFAP98_A

Step 2. Test the MapReduce jobs using bash pipeline.

```
cat data.csv | mapper1.py | sort | reducer1.py | mapper2.py | sort |
reducer2.py 
```


Step 3. Run MapReduce jobs using Hadoop. 
```
bin/hadoop jar /Users/christopher/Desktop/myhadoop/hadoop-3.3.1/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file /Users/christopher/Desktop/hadoopminiproject/mapper1.py -mapper "python3 mapper1.py" \
-file /Users/christopher/Desktop/hadoopminiproject/reducer1.py -reducer "python3 reducer1.py" \
-input /hadoopminiproject/hadoopminiproject/data.csv -output /hadoopminiproject/hadoopminiproject/stepone


bin/hadoop jar /Users/christopher/Desktop/myhadoop/hadoop-3.3.1/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file /Users/christopher/Desktop/hadoopminiproject/mapper2.py -mapper "python3 mapper2.py" \
-file /Users/christopher/Desktop/hadoopminiproject/reducer2.py -reducer "python3 reducer2.py" \
-input /hadoopminiproject/hadoopminiproject/stepone -output /hadoopminiproject/hadoopminiproject/steptwo
```

Final output should be similar to below. \

![Screen Shot 2021-12-14 at 8 34 18 PM](https://user-images.githubusercontent.com/60493376/146258704-9ac2fd36-596e-4f59-a611-04b1754975bd.png)

