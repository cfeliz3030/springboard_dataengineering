import sys
# input comes from STDIN (standard input)
for line in sys.stdin:
    line = line.strip()
    values = line.split(',')
    # print(values)
    key = values[2]
    value = values[1], values[3], values[5]
# [derive mapper output key values]
    print(f'{key}\t{value[0]}\t{value[1]}\t{value[2]}')