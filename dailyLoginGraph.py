import sqlite3, pandas , matplotlib.pyplot as plt

conn = sqlite3.connect("./shiptivity.db")
 
sql = """SELECT 
        COUNT(user_id) as 'login_count', 
        date(login_timestamp, 'unixepoch') as login_date
    FROM 'login_history'
    GROUP BY login_date"""
 
data = pandas.read_sql(sql, conn)
#x values: data.Country,  y values: data.sum_deaths
plt.bar(data.login_date, data.login_count)
plt.title("Daily Login Count")
plt.show()