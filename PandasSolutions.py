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
