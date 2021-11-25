## Data Pipeline Mini Project
### Event Ticket System Case Study

In this project we will build a data pipeline which reads data from a csv file and writes it out to a database.

The table we will be working with has the following schema. \
![Screen Shot 2021-11-25 at 12 29 51 AM](https://user-images.githubusercontent.com/60493376/143406277-32a080cd-8111-4257-a6c2-7e2822caad96.png)

### Step-by-Step Instructions:
Step 1. Install MySQL Python connector

Step 2. Load third-party ticket sales data into MySQL database \
2.1 Setup database connection
In order to make a query against the database table, we need to first connect to it. A connection
can be established only when the user provides the proper target host, port, and user
credentials \
2.2 Load CSV to table

Step 3. Display statistical information
After the data is loaded into the table, you can use this data to provide recommendations to the
user. For instance, recommending popular events by finding the most top-selling tickets for the
past month.

3.2 Display the result
![Screen Shot 2021-11-24 at 11 47 34 PM](https://user-images.githubusercontent.com/60493376/143406931-c57b8b52-93b6-43ca-990a-e51521e40293.png)

After the main script is ran a log file will be generated which tracks all interactions with the database.
