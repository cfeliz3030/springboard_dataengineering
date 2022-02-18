from pathlib import Path

def analyze_file(files,error_type):
    """ Parses log files, returns count of specific error type and actual error. """

    if error_type not in ['INFO', 'WARNING', 'ERROR']:
        return 'Please use appropriate error type (ex.INFO, WARNING, ERROR)'

    num_errors = 0
    errors = []
    for log in files:
        with log.open() as f:
            for line in f:
                if error_type in line.split(' '):
                    errors.append(line)
                    num_errors += 1
    if errors:
        return f'Total number of errors: {num_errors} \nHere are all the errors: {errors} '
    # if errors:
    #     return num_errors, errors 
    
    return 'No errors found.'


log_dir = '/Users/christopher/airflow/logs/marketvol'

file_list = [ f.resolve() for f in Path(log_dir).rglob('*.log')]

# for f in file_list:
#     print(analyze_file(f,'ERROR'))

# print(f'Total number of errors {total_errors} \nHere are all the errors: {all_errors} ')

print(analyze_file(file_list,'ERROR'))