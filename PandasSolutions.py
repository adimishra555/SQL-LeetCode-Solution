------------------------------------------------------------- PANDAS SOLUTION From LeetCode ----------------------------------------------------------------


-> Recyclable and Low Fat Products
import pandas as pd
def find_products(products: pd.DataFrame) -> pd.DataFrame:
    df = products[(products['low_fats'] =='Y') & (products['recyclable'] =='Y')]
    df = df[['product_id']]
    return df

#  Find Customer Referee
import pandas as pd
def find_customer_referee(customer: pd.DataFrame) -> pd.DataFrame:
    # res = customer[customer['referee_id'].fillna('')!=2]['name']
    df = customer[customer['referee_id'].fillna(0) != 2]
    res = df[['name']]
    return res

# Big Countries
import pandas as pd
def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    big_country = world[(world['area'] >=3000000) | (world['population']  >=25000000)] 
    return big_country[['name', 'population','area']]

# Article Views I
import pandas as pd
def article_views(views: pd.DataFrame) -> pd.DataFrame:
    filter_row  = views[views['author_id'] == views['viewer_id']]
    unique_authors = filter_row['author_id'].unique()
    unique_authors = sorted(unique_authors)
    res_df = pd.DataFrame({'id': unique_authors})
    return res_df


# Invalid Tweets
import pandas as pd
def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    invalid_tweetsdf = tweets[tweets['content'].str.len() >15]
    resdf= invalid_tweetsdf[['tweet_id']]
    return resdf


# Replace Employee ID With The Unique Identifier
import pandas as pd
def replace_employee_id(employees: pd.DataFrame, employee_uni: pd.DataFrame) -> pd.DataFrame:
    merged_table = employees.merge(employee_uni, on='id', how = 'left')
    res = merged_table[['unique_id', 'name']]
    return res

# Product Sales Analysis I
def sales_analysis(sales: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    return pd.merge(sales, product, on='product_id') [['product_name', 'year','price']]

# Customer Who Visited but Did Not Make Any Transactions
import pandas as pd
def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    # df = visits.merge(transactions, how = 'left')
    # df = df[df['transaction_id'].isna()].groupby(['customer_id'], as_index=False).agg(count_no_trans =('visit_id', 'nunique'))
    # return df
    df = visits.merge(transactions, how='left')
    result = df[df['transaction_id'].isna()].groupby('customer_id', as_index=False)['visit_id'].nunique().rename(columns={'visit_id': 'count_no_trans'})
    
    return result


# Rising Temperature
import pandas as pd
def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:
    weather.sort_values(by = 'recordDate', inplace = True)
    date_diff = weather['recordDate'].diff().dt.days
    temp_diff = weather['temperature'].diff()
    return weather[(date_diff==1) & (temp_diff > 0)][['id']]

# Average Time of Process per Machine
import pandas as pd
def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:
    activity = activity.pivot(index=['machine_id', 'process_id'], columns='activity_type', values='timestamp')
    activity['processing_time'] = activity['end'] - activity['start']
    result = activity.groupby('machine_id')['processing_time'].mean().reset_index()
    result['processing_time'] = result['processing_time'].round(3)
    return result

# Employee Bonus
import pandas as pd
def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:
    merged_df = employee.merge(bonus, on='empId', how='left')
    result_df = merged_df[(merged_df['bonus'] < 1000) | (merged_df['bonus'].isna())]
    result_df = result_df[['name', 'bonus']]
    return result_df


# Managers with at Least 5 Direct Reports
import pandas as pd
def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    managers = employee.groupby('managerId', as_index=False).agg(
        reporting=('id', 'count')
    ).query('reporting >= 5')['managerId']  
    return employee[employee['id'].isin(managers)][['name']]


# Confirmation Rate
import pandas as pd
def confirmation_rate(signups: pd.DataFrame, confirmations: pd.DataFrame) -> pd.DataFrame:
    total_requests = confirmations.groupby("user_id").size()
    confirmed_requests = confirmations[confirmations["action"] == "confirmed"].groupby("user_id").size()
    confirmation_rate = (confirmed_requests / total_requests).round(2).fillna(0)
    confirmation_rate_df = confirmation_rate.reset_index(name="confirmation_rate")
    result = pd.merge(signups, confirmation_rate_df, on="user_id", how="left").fillna({"confirmation_rate": 0})
    return result[["user_id", "confirmation_rate"]]
