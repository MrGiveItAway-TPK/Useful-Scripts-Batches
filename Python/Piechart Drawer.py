import matplotlib.pyplot as plt
Partition = 'Category1', 'Category2', 'Category3', 'Category4'
sizes = [100, 150, 100, 500]
fig1, ax1 = plt.subplots()
ax1.pie(sizes, labels=Partition, autopct='%1.1f%%', shadow=True, startangle=90)         
ax1.axis('equal')
plt.show()