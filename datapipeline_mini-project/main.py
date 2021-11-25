import csv
import mysql.connector
from creds import user, host, port, database, password, csv_filepath
import logging

# create logger object to record customer interactions
logger = logging.getLogger(__name__)
file = logging.FileHandler('ticket_sales.log', mode='a')
logger.setLevel(logging.INFO)
special_format = logging.Formatter('%(asctime)s %(name)s %(levelname)s %(message)s')
file.setFormatter(special_format)
logger.addHandler(file)


def get_db_connection(user, password, host, port, database):
    """create database connection"""
    connection = None
    logger.info(f'Connecting to {database}')
    try:
        connection = mysql.connector.connect(user=user,
                                             password=password,
                                             host=host,
                                             port=port,
                                             database=database)
        logger.info(f'Connected to {database}')
    except Exception as error:
        logger.info(f"Error while connecting to {database}", error)
    return connection


def create_table(connection, query):
    """Create new table within database"""
    logger.info('Creating new table')
    try:

        cursor = connection.cursor()
        cursor.execute(query)
        connection.commit()
        logger.info('New table created!')
    except Exception as error:
        logger.info("Error while creating table", error)
    finally:
        cursor.close()
    return


def load_third_party(connection, file_path_csv):
    """Load csv file line by line into table"""
    logger.info('Preparing to insert new records into table')
    cursor = connection.cursor()
    sql = """insert into ticket_sales(ticket_id,trans_date,event_id,event_name,event_date,event_type,
             event_city,customer_id,price,num_tickets)
             values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"""
    with open(file_path_csv, mode='r') as f:
        content = csv.reader(f)
        for row in content:
            logger.info(f'Inserting {row}')
            cursor.execute(sql, row)
    connection.commit()
    cursor.close()
    return


def query_popular_tickets(connection):
    """Get the most popular ticket in the past month"""
    logger.info('Retrieving records from database')
    sql_statement = """with cte as (Select event_name, sum(num_tickets), dense_rank() over(order by sum(num_tickets) 
    desc) as ranks From springboard.ticket_sales group by event_name) 

    select event_name 
    from cte
    where ranks = 1"""
    cursor = connection.cursor()
    cursor.execute(sql_statement)
    records = cursor.fetchall()
    logger.info(f'Retrieved {records}')
    cursor.close()
    return records


# Ticket Sales Table Schema
create_ticket_sales = """
create table ticket_sales(
ticket_id int not null,
trans_date date not null,
event_id int not null,
event_name varchar(50),
event_date date,
event_type varchar(10),
event_city varchar(20),
customer_id int not null,
price decimal,
num_tickets int,
PRIMARY KEY (ticket_id))
"""

# connect to database
conn = get_db_connection(user, password, host, port, database)

# create table within database
create_table(conn, create_ticket_sales)

# load table with csv file data
load_third_party(conn, csv_filepath)

# query table for most popular tickets
popular_tickets = query_popular_tickets(conn)

# user friendly output for most popular tickets
print('Here are the most popular tickets in the past month:')
for i in range(len(popular_tickets)):
    print(f'{i + 1}:', popular_tickets[i][i - 1])
