# Movie Rating Prediction Model

## Project Overview:
The Movie Rating Prediction Model endeavors to create a robust machine learning model that forecasts viewer ratings for movies, specifically tailored to provide actionable insights for filmmakers. Leveraging data from [OMDb API](https://www.omdbapi.com/) for movie details and viewer ratings, and [The Numbers](https://www.the-numbers.com/) for comprehensive movie budget information, the project aims to enhance decision-making in the dynamic world of film production.

## Dependencies:
To run the code, you will need the following dependencies:
+ pip install jupyter
+ pip install pandas
+ pip install scikit-learn

## Data Sources:
Provide more details about the structure and nature of the data obtained from OMDb API and The Numbers. Include sample records if possible:
### [The Numbers](https://www.the-numbers.com/)
The project leverages movie budget data obtained from The Numbers, a comprehensive movie industry data platform. The data retrieval process involves web scraping to collect information such as release dates, production budgets, and box office earnings for a diverse range of movies. The scraping script utilizes Python libraries, including Splinter for browser automation and BeautifulSoup for HTML parsing.

The steps include:
+ Iteratively navigating through pages to cover a wide range of movies.
+ Scraping relevant details like release date, movie title, production budget, domestic gross, and worldwide gross.
+ Exporting the raw data to a CSV file for further processing and analysis.

### [OMDb API](https://www.omdbapi.com/)
 To enrich the dataset with additional details and viewer ratings, the project queries the OMDb API. This API provides comprehensive information about movies, including details such as title, director, cast, ratings, and more.

The data retrieval involves:
+ Utilizing the list of movie titles obtained from The Numbers scrape.
+ Querying the OMDb API for each movie to gather details like genre, director, writer, actors, ratings, and box office performance.
+ Handling the challenge of potential non-movie matches due to shared titles with TV shows or different media types.
+ Cleaning and formatting the data, including consolidating rating categories and converting currency and runtime values.
+ Exporting the final dataset to a CSV file for subsequent machine learning model training.

Note: Both data retrieval processes involve substantial time investments, and running the notebooks may take an extended period due to the volume of API calls and web scraping operations.

### [IMDb TSV Files](https://www.tableau.com/community/movies/starter-kit?)
In addition to The Numbers data, IMDb ratings and details were incorporated into the dataset to provide a more comprehensive understanding of movie outcomes. IMDb, in partnership with Tableau, provides TSV (Tab-Separated Values) files containing valuable information about movie titles, ratings, and more.


## Exploratory Data Analysis (EDA):
Highlight key findings from your EDA phase, such as distribution of ratings, budget trends, or any significant patterns observed.

## Data Preprocessing:
Detail the steps taken to clean and preprocess the data, addressing any missing values, outliers, or inconsistencies.

## Visualizations:
Embed visualizations or link to relevant notebooks showcasing visual explorations of the data and model performance.

## Model Training:
The model is trained using the Random Forest Regressor. Example code snippet:
![image]([https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/132225987/3332fbb5-1c12-45a2-babb-4fc0f8cc28ed])

## Current Model Configuration:
The current machine learning model for adult movies utilizes the following features:
+ Features: ['ProductionBudget', 'OMDB_BoxOffice', 'OMDB_imdbVotes', 'DomesticGross', 'OMDB_Metascore', 'Director_Avg_Rating']
+ Target: 'OMDB_imdbRating'
+ Model: Random Forest Regressor with 100 estimators and a random state of 42.

## Feature Engineering:
Certain features required modification for model compatibility. For instance, encoding and dummy variables were applied to non-numeric values.

## Results and Insights:
The project is still in the configuration phase, but initial findings suggest that director ratings are highly influential in predicting the success of a movie.

## Contributors
+ Rebekah Aldrich [GitHub](https://github.com/vt-bekah) | [LinkedIn](https://www.linkedin.com/in/rebekah-aldrich-13103219/)
+ Christopher Hornung [GitHub](https://github.com/cjhornung) | [LinkedIn](https://www.linkedin.com/in/christopherjhornung/)
+ Alejandro Davila [GitHub](https://github.com/alejandro-davila) | [LinkedIn](https://www.linkedin.com/in/alejandro-davila-61845b1b/)
+ Ashley Ley [GitHub](https://github.com/ashley-ley) | [LinkedIn](https://www.linkedin.com/in/ashley-ley1/)
+ Bryant Griessel [GitHub](https://github.com/demzilla) [LinkedIn](https://www.linkedin.com/in/bryant-griessel-6630a0185/)

## File Structure
+ < html, css, JS files >
+ Python folder contains all the python used to clean and investigate data as well as create machine learning models
    + Movie Maker scenario files
        + **Numbers_OMDB_data_collection.ipynb** scrapes the Numbers webpage and calls to the OMDB API to get the remaining movie data. It exports 3 csv files to avoid making the lengthy OMDB API call in the future (raw, formatted, processed)
        + **Numbers_OMDB_people_ratings.ipynb** creatings rating values for individual people (writer, director, actor) in the Numbers_OMDB data and exports a dictionary of those ratings in csv format
        + **Numbers_OMDB_add_people_ratings.ipynb** pulls in the ratings of the individual people per movie line exporting the "FINAL" data file for Numbers_OMDB
        + **movie_maker_models.ipynb** looks at Random Forest and Keras Tuner models to determine which is better, plotting predicted vs. actual as well as exporting the features, target, and predictions to a single csv.
    + General Movie Viewer & Specific Movie User scenario files
        + **IMDB_cleaning.ipynb** scrapes the Numbers webpage and loads the iMDB tsv files for cleaning. It exports movies_raw_imdb.csv
        + **IMDB_OMDB_data_collection.ipynb** pulls in the IMDB csv files exported from the SQL queries and calls to the OMDB API to get the remaining movie data. It exports 3 csv files to avoid making the lengthy (*~8 hours!*) OMDB API call in the future (raw, formatted, processed)
        + **IMDB_OMDB_people_ratings.ipynb** creatings rating values for individual people (writer, director, actor) in the IMDB_OMDB data and exports a dictionary of those ratings in csv format
        + **IMDB_OMDB_add_people_ratings.ipynb** pulls in the ratings of the individual people per movie line exporting the "FINAL" data file for IMDB_OMDB
        + **movie_viewer_models.ipynb** looks at Random Forest and Keras Tuner models to determine which is better, plotting predicted vs. actual as well as exporting the features, target, and predictions to a single csv for general users
        + **movie_user_models.ipynb** pulls in the specific user rating data with the IMDB_OMDB data, looks at Random Forest and Keras Tuner models to determine which is better, and plots predicted vs. actual as well as exporting the features, target, and predictions to a single csv for general users
+ SQL folder contains the SQL script to refine and merge the imdb tsv files into reduced csv files
+ Resources folder contains all the csv files exported throughout the data cleaning process and machine learning results
    + Movie Maker scenario files
        + **Numbers_OMDB_movies_raw.csv** is the data collected from scraping the numbers website and calling OMDB data based on those titles
        + **Numbers_OMDB_formatted.csv** is the same data as *movies_raw but with strings formatted into numbers
        + **Numbers_OMDB_processed.csv** is the formatted data with cleaning such as merging similar MPAA ratings and dropping movies pre-1980
        + **Numbers_OMDB_writer_data.csv** is the dictionary of writer data based on Numbers_OMDB input
        + **Numbers_OMDB_director_data.csv** is the dictionary of director data based on Numbers_OMDB input
        + **Numbers_OMDB_actor_data.csv** is the dictionary of actor data based on Numbers_OMDB input
        + **Numbers_OMDB_FINAL.csv** is the complete data file to be used for machine learning modeling cleaned with people ratings
        + **movie_maker_model_results.csv** contains the features, target, and predictions data for the top model found to predict movie ratings for writers and directors
    + General Movie Viewer & Specific Movie User scenario files
        + **movies_raw_imdb.csv** is the python cleaned IMDB data with budget included
        + **IMDB_SQL_Titles.csv** is the SQL output of cleaned titles data from the IMDB tsv files
        + **IMDB_SQL_Ratings.csv** is the SQL output of cleaned ratings data from the IMDB tsv files
        + **IMDB_OMDB_movies_raw.csv** is the data collected from IMDB tsv files and calling OMDB data based on the unique id
        + **IMDB_OMDB_formatted.csv** is the same data as *movies_raw but with strings formatted into numbers
        + **IMDB_OMDB_processed.csv** is the formatted data with cleaning such as merging similar MPAA ratings and genres as well as dropping movies pre-1980
        + **IMDB_OMDB_writer_data.csv** is the dictionary of writer data based on IMDB_OMDB input
        + **IMDB_OMDB_director_data.csv** is the dictionary of director data based on IMDB_OMDB input
        + **IMDB_OMDB_actor_data.csv** is the dictionary of actor data based on IMDB_OMDB input
        + **IMDB_OMDB_FINAL.csv** is the complete data file to be used for machine learning modeling cleaned with people ratings
        + **movie_viewers_model_results.csv** contains the features, target, and predictions data for the top model found to predict general viewer movie ratings after a movie is made
        + **user_only_model_results.csv** contains the features, target, and predictions data for the top model found to predict a *specific* viewer's movie ratings after a movie is released with some ratings (e.g. Netflix predicting what you like)
        + **user_model_results_4400.csv** is the result of applying the user model to the full data set with required features to be used for the webpage
