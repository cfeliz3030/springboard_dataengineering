from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from datetime import date, datetime, timedelta
import yfinance as yf
import pandas as pd

today = date.today().strftime("%m-%d-%y")

def download_market_data(company, **kwargs):
    start_date = date.today() - timedelta(days=4)
    # end_date = start_date + timedelta(days=1)
    df = yf.download(company, start=start_date, interval='1m')
    df.to_csv(f"{company}.csv",  header=['open','high','low','close','adj_close','volume'])

def custom_query():
    df_tsla = pd.read_csv(f"/tmp/data/{today}/TSLA.csv")
    df_apple = pd.read_csv(f"/tmp/data/{today}/AAPL.csv")
    print(df_tsla.head())
    print(df_apple.head())


default_args = {
    'owner':'airflow',
    'start_date': datetime.now() - timedelta(days=1),
    'retries': 2,
    'retry_delay': timedelta(minutes=5)
}

with DAG(dag_id='marketvol',default_args=default_args, schedule_interval='0 18 * * 1-5',catchup=False) as dag:

    t0 = BashOperator(task_id = 'create_temp_dir', bash_command= f"mkdir -p /tmp/data/{today}")

    t1 = PythonOperator(task_id = 'download_apple_data', python_callable=download_market_data,op_kwargs={"company":'AAPL'})

    t2 = PythonOperator(task_id = 'download_tesla_data', python_callable=download_market_data,op_kwargs={"company":'TSLA'})

    t3 = BashOperator(task_id = 'move_files_t3', bash_command= f" mv /Users/christopher/airflow_workspace/airflow_env/TSLA.csv /tmp/data/{today}/")

    t4 = BashOperator(task_id = 'move_files_t4', bash_command=f" mv /Users/christopher/airflow_workspace/airflow_env/AAPL.csv /tmp/data/{today}/")

    t5 = PythonOperator(task_id = 'query_data', python_callable=custom_query)

    t0 >> t1 >> t3 
    t0 >> t2 >> t4 >> t5

    # t0 >> [t1,t2] >> [t3,t4]
    # t0 >> [t1,t2]
    # [t3,t4] >> t5

