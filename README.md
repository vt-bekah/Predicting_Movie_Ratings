# Movie Rating Prediction Model

## Project Overview:
The main goal of this project is to create a machine learning model that predicts viewer ratings for movies, with a focus on providing insights for movie makers. The dataset used for training and testing the model is sourced from [OMDb API](https://www.omdbapi.com/) for movie details and viewer ratings, as well as [The Numbers](https://www.the-numbers.com/) for movie budgets.

## Dependencies:
To run the code, you will need the following dependencies:
+ pip install jupyter
+ pip install pandas
+ pip install scikit-learn

## Model Training:
The model is trained using the Random Forest Regressor. Example code snippet:
![image](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/132225987/3332fbb5-1c12-45a2-babb-4fc0f8cc28ed)

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