import mysql.connector
​
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="More@123"
)
​
cursor = conn.cursor()
​
print("Connected to MySQL")
Connected to MySQL
cursor.execute("CREATE DATABASE investor_db")
cursor.execute("USE investor_db")
create_table_query = """
CREATE TABLE investor_transactions (
    investor_id INT,
    name VARCHAR(100),
    city VARCHAR(100),
    stock VARCHAR(50),
    amount FLOAT
)
"""
​
cursor.execute(create_table_query)
import pandas as pd
​
df = pd.read_csv("processed_investor_data.csv")
for index, row in df.iterrows():
    cursor.execute(
        "INSERT INTO investor_transactions VALUES (%s,%s,%s,%s,%s)",
        (row['investor_id'], row['name'], row['city'], row['stock'], row['amount'])
    )
​
conn.commit()
cursor.execute("SELECT * FROM investor_transactions LIMIT 5")
​
for row in cursor.fetchall():
    print(row)
(30, 'Vikram Patel', 'Ahmedabad', 'ICICI', 63152.0)
(34, 'Amit Desai', 'Bangalore', 'ICICI', 54783.0)
(34, 'Amit Desai', 'Bangalore', 'TCS', 77800.0)
(37, 'Anjali Singh', 'Chennai', 'INFY', 92559.0)
(37, 'Anjali Singh', 'Chennai', 'TCS', 82915.0)
query = """
SELECT city, SUM(amount)
FROM investor_transactions
GROUP BY city
"""
​
cursor.execute(query)
​
for row in cursor.fetchall():
    print(row)
('Ahmedabad', 1064958.0)
('Bangalore', 781587.0)
('Chennai', 602194.0)
('Mumbai', 473533.0)
('Hyderabad', 809913.0)
('Pune', 674463.0)
('Delhi', 809615.0)
cursor.execute("SELECT * FROM investor_transactions LIMIT 5")
​
for row in cursor.fetchall():
    print(row)
(30, 'Vikram Patel', 'Ahmedabad', 'ICICI', 63152.0)
(34, 'Amit Desai', 'Bangalore', 'ICICI', 54783.0)
(34, 'Amit Desai', 'Bangalore', 'TCS', 77800.0)
(37, 'Anjali Singh', 'Chennai', 'INFY', 92559.0)
(37, 'Anjali Singh', 'Chennai', 'TCS', 82915.0)
query = """
SELECT city, SUM(amount)
FROM investor_transactions
GROUP BY city
"""
​
cursor.execute(query)
​
for row in cursor.fetchall():
    print(row)
('Ahmedabad', 1064958.0)
('Bangalore', 781587.0)
('Chennai', 602194.0)
('Mumbai', 473533.0)
('Hyderabad', 809913.0)
('Pune', 674463.0)
('Delhi', 809615.0)
​