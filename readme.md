## Introduction

This project analyzes a dataset containing information about movies, including their titles, release years, ratings, watch times, number of views, IMDb ratings, awards won, budgets, box office revenues, genres, directors, countries of origin, and languages.

## Methodology

### Data Source

The dataset used in this analysis was extracted from a movie database, which includes detailed information on movies released over several decades. The dataset comprises multiple tables, including `movie_table`, `genre_table`, `director_table`, `countries_table`, `language_table`, and `movie_genre_table`.

### Data Cleaning and Preparation

Before beginning the analysis, the data was cleaned and prepared using the following steps:

- **Missing Values**: Identified and handled missing values in key columns like `box_office_revenue`, `budget`, and `IMDb_rating`.
- **Data Types**: Ensured that each column had the correct data type, such as integers for `budget` and `box_office_revenue`, and dates for `release_year`.
- **Normalization**: The dataset was normalized to reduce redundancy and improve the efficiency of the analysis.

### Data Analysis

The analysis was conducted using SQL queries to answer specific questions about the dataset. The following key queries were performed:

1. **Total Number of Movies**: Counted the total number of movies in the dataset.
2. **Trends in Box Office Revenue Over Time**: Analyzed the yearly trends in box office revenue to identify growth patterns, peaks, and declines.
3. **Top Genres by Box Office Revenue**: Identified the genres that generated the highest box office revenues.
4. **Director Impact on Box Office Revenue**: Evaluated the impact of different directors on box office success.

The results from these queries were then summarized and visualized to provide clear insights into the movie industry.

## Results

### Total Number of Movies

The dataset contains a total of **1394 movies** released between 2000 and 2022.

### Trends in Box Office Revenue Over Time

The analysis of box office revenue over time revealed several key trends:

- **Steady Growth (2000-2003)**: Box office revenue showed consistent growth from 2000 to 2003, with an average annual increase of 5%.
- **Peak in 2015**: The highest box office revenue was recorded in 2015, largely due to the release of several blockbuster films.
- **Decline in 2013**: A significant decline in revenue was observed in 2013.

### Top Genres by Box Office Revenue

The analysis identified the following genres as the top earners in terms of box office revenue:

1. **Horror $6,467,297,553**
2. **Romance $61,461,046,142**
3. **Drama $58,162,885,346**
4. **Comedy $54,705,323,064**
5. **Action $53,757,798,772**
6. **Thriller $50,646,187,673**

### Director Impact on Box Office Revenue

Certain directors had a significant impact on box office success:

- **Steven Spielberg**: Directed multiple films that collectively grossed over $6 billion in box office revenue.
- **Christopher Nolan**: Known for directing some of the highest-grossing movies, including "The Lord of the Rings: The Return of the King" and "The Godfather".

## Conclusion

The project provided insights into trends in the movie industry. The data shows a growing industry with increasing revenues, though certain years showed declines likely influenced by external factors.
