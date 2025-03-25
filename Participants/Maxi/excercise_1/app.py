import pandas as pd
import plotly.express as px

# Load the gapminder dataset
df = px.data.gapminder()

# Filter the dataset for the year 2007
df_2007 = df[df["year"] == 2007]

# Calculate the average life expectancy by continent
avg_life_exp_by_continent = df_2007.groupby(
    "continent")["lifeExp"].mean()

# Print the result
print(avg_life_exp_by_continent)
