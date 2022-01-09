
from pyspark import SparkContext,SparkConf

conf = SparkConf().setAppName('miniproject').setMaster('local')

sc = SparkContext(conf=conf)

raw_rdd = sc.textFile('/Users/christopher/Downloads/spark-3.1.1-bin-hadoop2.7/bin/data.csv')

raw_rdd.take(5)

def extract_vin_key_value(line):
    vals = line.strip().split(',')
    vin = vals[2]
    make = vals[3]
    year = vals[5]
    itype = vals[1]
    return vin, (make,year,itype)

raw_rdd.map(lambda x: extract_vin_key_value(x)).collect()

vin_kv = raw_rdd.map(lambda x: extract_vin_key_value(x))


def populate_make(values):
    output_vals = []
    
    for v in values:
        if v[0]:
            make = v[0]
        
        if v[1]:
            year = v[1]
            
        output_vals.append((make,year,v[2]))
    
    return output_vals
    
vin_kv.groupByKey().flatMap(lambda kv: populate_make(kv[1])).collect()

enhance_make = vin_kv.groupByKey().flatMap(lambda kv: populate_make(kv[1]))


def extract_make_key_value(values):
    if values[2] == 'A':
        return values[0] + ' ' + values[1],1
    
    return values[0] + values[1], 0  


enhance_make.map(lambda x: extract_make_key_value(x)).collect()

make_kv = enhance_make.map(lambda x: extract_make_key_value(x))


final_count = make_kv.reduceByKey(lambda x, y: x + y)

for v in final_count.collect():
    if v[1] > 0:
        print(v)