import sys


def flush():
    for key in accident_count:
        print(f'{key}\t{accident_count[key]}')


# create dictionary to store accident counts
accident_count = {}

for line in sys.stdin:
    line = line.strip()
    values = line.split('\t')
    make_year = values[0]
    accidents = int(values[1])

    if make_year not in accident_count:
        accident_count[make_year] = 1
    else:
        accident_count[make_year] += accidents

flush()
