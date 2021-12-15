import sys

# [Define group level master information]
curr_vin = None
vin = None
make = None
year = None


def reset():
    # [Logic to reset master info for every new group]
    curr_vin = None
    vin = None
    make = None
    year = None


def flush():
    # [Write the output]
    # input comes from STDIN
    print(f'{curr_vin}\t{make}\t{year}')


# input comes from STDIN
# [parse the input we got from mapper and update the master info]
for line in sys.stdin:
    line = line.strip()
    values = line.split("\t")

    vin = values[0]
    incident_type = values[1]
    if curr_vin == vin and incident_type == 'I':
        make = values[2]
        year = values[3]
    if curr_vin != vin:
        if curr_vin is not None:
            flush()
        reset()
    if incident_type == 'I':
        make = values[2]
        year = values[3]
    curr_vin = vin

flush()
