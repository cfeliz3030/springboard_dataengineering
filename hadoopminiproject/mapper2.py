import sys

for line in sys.stdin:
    line = line.strip()
    values = line.split('\t')
    #print(values)
    make = values[1]
    year = values[2]
    print(f'({make}, {year})\t 1')