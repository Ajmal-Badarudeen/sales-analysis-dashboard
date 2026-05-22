import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv(r'D:\Projects\Indian_Retail_Sales\dataset.csv')
# df=pd.read_csv('C:/Users/Aji/Documents/Projects/Indian_Retail_Sales/data/dataset.csv')

# Feature Engineering
df['Order Date'] = pd.to_datetime(df['Order Date'],dayfirst=True, errors='coerce')
df['Month'] = df['Order Date'].dt.to_period('M')

# KPIs
print('Total Sales:', df['Sales'].sum())
print('Total Profit:', df['Profit'].sum())

# Sales Trend
df.groupby('Month')['Sales'].sum().plot()
plt.title('Monthly Sales Trend')
plt.show()

# Region Sales
df.groupby('Region')['Sales'].sum().plot(kind='bar')
plt.title('Sales by Region')
plt.show()

# Top Customers
print(df.groupby('Customer Name')['Sales'].sum().sort_values(ascending=False).head(10))
