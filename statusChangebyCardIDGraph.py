import sqlite3, pandas , matplotlib.pyplot as plt

conn = sqlite3.connect("./shiptivity.db")
 
sql = """SELECT 
    cardID,
    COUNT(id) as 'status_change_count'
FROM 'card_change_history' as history
WHERE oldStatus != newStatus
GROUP BY cardID"""
 
data = pandas.read_sql(sql, conn)
#x values: data.Country,  y values: data.sum_deaths
plt.bar(data.cardID, data.status_change_count)
plt.title("Status Change Count by Card ID")
plt.show()