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

