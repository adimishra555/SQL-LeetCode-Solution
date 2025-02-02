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
