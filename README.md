# Movie Rating Prediction Model

## 1. Project Overview:
The Movie Rating Prediction Model endeavors to create a robust machine learning model that forecasts viewer ratings for movies, specifically tailored to provide actionable insights for filmmakers. Leveraging data from [OMDb API](https://www.omdbapi.com/) for movie details and viewer ratings, and [The Numbers](https://www.the-numbers.com/) for comprehensive movie budget information, the project aims to enhance decision-making in the dynamic world of film production.

## 2. Dependencies:
To run the code, you will need the following dependencies:
+ pip install jupyter
+ pip install pandas
+ pip install scikit-learn

## 3. Data Sources:
Provide more details about the structure and nature of the data obtained from OMDb API and The Numbers. Include sample records if possible:

### 3.1 [The Numbers](https://www.the-numbers.com/)
The project leverages movie budget data obtained from The Numbers, a comprehensive movie industry data platform. The data retrieval process involves web scraping to collect information such as release dates, production budgets, and box office earnings for a diverse range of movies. The scraping script utilizes Python libraries, including Splinter for browser automation and BeautifulSoup for HTML parsing.

The steps include:
+ Iteratively navigating through pages to cover a wide range of movies.
+ Scraping relevant details like release date, movie title, production budget, domestic gross, and worldwide gross.
+ Exporting the raw data to a CSV file for further processing and analysis.

### 3.2 [OMDb API](https://www.omdbapi.com/)
 To enrich the dataset with additional details and viewer ratings, the project queries the OMDb API. This API provides comprehensive information about movies, including details such as title, director, cast, ratings, and more.

The data retrieval involves:
+ Utilizing the list of movie titles obtained from The Numbers scrape.
+ Querying the OMDb API for each movie to gather details like genre, director, writer, actors, ratings, and box office performance.
+ Exporting the final dataset to a CSV file for subsequent machine learning model training.

Note: Both data retrieval processes involve substantial time investments, and running the notebooks may take an extended period due to the volume of API calls and web scraping operations.

### 3.3 [IMDb TSV Files](https://www.tableau.com/community/movies/starter-kit?)
In addition to The Numbers data, IMDb ratings and details were incorporated into the dataset to provide a more comprehensive understanding of movie outcomes. IMDb, in partnership with Tableau, provides TSV (Tab-Separated Values) files containing valuable information about movie titles, ratings, and more.

## 4. Data Preprocessing:

Preprocessing included:
+ Creating dictionaries for director, writer, and actor ratings to store instances, total/average values of box office, production budget, metascore, and IMDb rating for each director, writer, and actor.
+ Handling the challenge of potential non-movie matches due to shared titles with TV shows or different media types.
+ Cleaning and formatting the data, including consolidating rating categories and converting currency and runtime values.
+ OMDB_Rated had 20 categories with overlap which have been reduced to 4 categories: kids (G, PG), teens (PG13), adults(NC-17+, R), and unknown

## 5. Exploratory Data Analysis (EDA) and Visualizations:

Significant patterns observed included: 
+ Release Month is relatively evenly distributed across months
+ Release Year indicates a tail of movies pre-1980 which have been truncated. We dropped movies with release year < 1980 because there was a relatively low quantity of data points and we didn’t want to complicate matters my introduction inflation

     ![ReleaseYear](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/ddd0c1fb-1b7a-4a4b-8cc3-92b15872c746)
     ![DropReleaseYear](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/613d8476-81de-4ddf-b593-0a4e8410d9aa)

+ Budgets have a tail above 100,000,000 with the biggest chunk at <= 20,000,000 (another potential break could be 50,000,000). All have been kept for the minor processing.

     ![ProductionBudget1](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/3c2b2a48-f689-4199-bd33-2a9d024fb478)
     ![ProductionBudget2](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/0a3919a7-a902-4c9c-8221-c64d4983e5da)

  
+ Runtime has most movies between 80 and 150 minutes with tails on both ends. All have been kept for minor processing.

     ![Runtime1](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/1e88cf55-cd8d-4bfd-a70b-b504199d9530)
     ![Runtime2](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/3a724cdc-92a1-4ad5-9802-e6f017411ba7)
  
+ OMDB_Production has very few values filled
+ OMDB_Genre, OMDB_Director, OMDB_Writer, OMDB_Actors, OMDB_Language, OMDB_Country all have lists within the list
* OMDB_Metascore has a relatively normal distribution

     ![Metascore](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/b440cad6-1dc6-4fed-99a5-849cdff29ea1)
 
* OMDB_imbdRating has a relatively normal distribution with a tail on the lower end

     ![imdbrating](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/54289614-af3e-45e0-bf0b-a1ff7335445b)
  
* OMDB_BoxOffice has a long tail above 200,000,000; most fall under 100,000,000

     ![boxoffice](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/cc2cd162-bb4f-4073-83f9-76d77af09a1b)
     ![boxoffice2](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/5f2c2311-1116-4da3-a46e-e06a12757acd)

#### Notes on Ouput Relationships
* Metascore and imdbRating have a mediocre positive relationship

     ![imdb v metascore](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/91e53e63-a6d2-4efb-a30b-c52a659ff60c)

* Box Office does **not** have a meaningful relationship with Metascore nore imdbRating

     ![metascore v boxoffice](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/e53c6b81-2c39-4be1-9759-f56fa33a19fe)
     ![imdb v boxoffice](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/c73f2639-cdee-4408-a900-ba76b922880b)
  
#### Notes on Input to Output Relationships
* Budget does **not** have a meaningful relationship to imdbRating nor Metascore

     ![imdb v budget](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/3819b822-42f8-418c-9ffc-dfe2437e28df)
     ![metascore v budget](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/3216d1ed-c6dc-4599-bbdb-dfe168424c28)
  
* Budget does have a minor positve relationship with Box Office

     ![boxoffice v budget](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/779f9880-7ad2-49ec-9a7a-596b86e5e2c5)
 
* Runtime does **not** have a meaningful relationship to imdbRating

     ![imdb v budget](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/3289c775-5fbc-40e3-b0ab-3f0429c6b0ee)

 
* Box Office box-and-whisker plots by month show quite a few outliers with Box Office above 20,000,000. Removing all movies with Box Office greater than 20,000,000 does show June, July, and December with the best Box Office return

     ![initial box plot for each month's BoxOffice](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/d6432dc7-bad5-406a-b0bb-de08ba209e7b)
     ![box plot for each month's BoxOffice for movies with Box Office less than 20,0000,000](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/ae66374d-8549-4657-9329-99f4699630ff)

 
* imdbRating box-and-whisker plots by month do not show much variation across months

  ![box plot for each month's BoxOffice](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/134234019/f832eb59-698d-46e5-8e1a-be1260e785f1)


#### 5.1 Summary Findings to Kick-Off Machine Learning Experiments

* Single numeric feature relationships to the IMDB Rating outcome are very weak indicating challenges to using numeric only features to predict viewer ratings.
* Using a critic rating (e.g., Metascore) available to a release can help improve predicting viewer ratings (e.g., IMDB Rating).
* Budget has a minor positive relationship with Box Office but not with IMDB Rating so it could be helpful in predicting Box Office.
* Release month seems to have little impact on IMDB Rating but could be a useful factor in predicting Box Office.


## 6. Model Training and Configuration

In the pursuit of empowering diverse stakeholders within the film industry, our machine learning models offer tailored insights for three distinct scenarios: "The General Movie Viewer," "The Specific Movie User," and "The Movie Maker." Each model is meticulously designed to cater to the unique objectives and perspectives of movie enthusiasts, individual users seeking personalized recommendations, and industry professionals involved in the creative and strategic aspects of movie production.

### 6.1 The Movie Maker Scenario:
the focus is on predicting the IMDb rating for movies based on the collaborative efforts of Writers and Directors, along with considerations for release month, budget, and runtime. Despite the minimal impact of demographic age groups, the model aims to assist writers and directors in gauging the anticipated popularity of a movie by emphasizing key contributors and relevant factors.

#### 6.1.1 The Movie Maker Scenario Random Forest Regression model:

* Plot the Random Forest Regression predictions and actuals together for Test Data
* 
* Plot the Random Forest Regression predictions and actuals together for Training Data

#### 6.1.2 The Movie Maker Scenario Keras Tuner-optimized Deep Neural Network model:

### 6.2 The General Movie Viewer Scenario: 
focuses on predicting IMDb ratings (averageRating) for moviegoers based on key contributors' ratings (Writers, Directors, and Actors), considering additional features like release month and runtime, with an exploration of the impact of a critic's score (Metascore). While budget information is unavailable in the larger dataset, the model targets audience viewers who contribute IMDb ratings after the movie release, aiming to capture the nuanced relationships between various features and audience ratings.

#### 6.2.1 The General Movie Viewer Scenario Random Forest Regression model:

* Plot the Random Forest Regression predictions and actuals together for Test Data
* Plot the Random Forest Regression predictions and actuals together for Training Data
  
#### 6.2.2 The General Movie Viewer Scenario Keras Tuner-optimized Deep Neural Network model:

* Plot the Keras Tuner-optimized Deep Neural Network predictions and actuals together for Test Data
* Plot the Keras Tuner-optimized Deep Neural Network predictions and actuals together for Training Data
 
### 6.3 The Specific Individual Movie User Scenario:
centers on predicting IMDb ratings (averageRating) for specific moviegoers based on key contributors' ratings (Writers, Directors, and Actors), with additional considerations for release month and runtime. Despite the absence of budget information in the larger dataset and the limited impact of age groups, the model aims to cater to individual viewers who contribute IMDb ratings post-movie release, emphasizing the intricate interplay between various contributors and individual audience preferences.

#### 6.3.1 The Specific Individual Movie User Scenario Random Forest Regression model:

#### 6.3.1 The Specific Individual Movie User Scenario Keras Tuner-optimized Deep Neural Network model:

## 7. Results and Insights:

[Tableau Story](https://public.tableau.com/app/profile/ashley.ley/viz/IMDBMovieAnalysis_17011356518300/Story1)

### 7.1 Writer Rating Feature 

Our machine learning models helped determine what features were helpful and which were unhelpful in terms of predicting movie ratings for Movie Makers (like writers and directors) or Movie Viewers (general public). After an analysis was run, the mean squared error (MSE) of different features was determined which features would be best used for our Movie Viewer Model. The findings are below.

    [(0.7446077994171829, 'Writer_Avg_Rating'),
    (0.07237972195283289, 'Actor_Avg_Rating'),
    (0.06643885261509044, 'Director_Avg_Rating'),
    (0.05744663649815371, 'OMDB_Metascore'),
    (0.023108750019075572, 'ProductionBudget'),
    (0.01991983110341534, 'OMDB_Runtime'),
    (0.011952615801406939, 'ReleaseMonth'),
    (0.004145792592842266, 'OMDB_Rated')]
    
For our Movie Maker model, the following features displayed a high relevance to our model and helped the model predictions strengthen. The findings are below

     [(0.7762904808060668, 'Writer_Avg_Rating'),
     (0.08435962178529609, 'Actor_Avg_Rating'),
     (0.07790682815058736, 'Director_Avg_Rating'),
     (0.024725005792194197, 'ProductionBudget'),
     (0.020016713908374107, 'OMDB_Runtime'),
     (0.012083045522792539, 'ReleaseMonth'),
     (0.004618304034689036, 'OMDB_Rated')]

With Writer Average Rating being significant for both of our machine learning models, we did a deeper dive to find out more about all movie writers. One question that arose was "Is writer rating dependent on or correlate with experience?" For example, if an author writes more movies, will their rating improve over time? A Tableau journey was taken to find some of those answers. 

### 7.2 Continue your analysis here: [Tableau Story](https://public.tableau.com/app/profile/ashley.ley/viz/IMDBMovieAnalysis_17011356518300/Story1)

Based on our findings, writer experience does not correlate with writer rating. Some of the most prolific writers (Stephen King and Luc Besson both with 25 movies written) are not among the highest rated movie writers! Quantity does not always equate quality in this case.

![image](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/132225987/d6f4b78a-b0fd-4cfa-b6d5-2cd26c1e2031)

![image](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/132225987/6f7530a4-c57c-4f9a-8e9a-291496ddb394)

### 7.3 Release Month Feature
While having the writer score and rating was valuable to our machine learning models, one feature that deemed to have little importance for each movie was its relase month. After breaking down each movie into its own category of kids movies= ['PG', 'G', 'TV-PG', 'TV-G', 'GP', 'M/PG', 'M'], teens = ['PG-13', 'TV-14', '16+', '13+'], adults = ['R', 'TV-MA', 'NC-17', 'X', '18+'] and Unknown = ['Not Rated', 'Approved', 'Unrated', 'Passed'], there didn't seem to be correlation between IMDB votes and the Box Office in relation to release months. This proved our point that release month showed little importance to predicting the strength of a new movie. 

![image](https://github.com/vt-bekah/Predicting_Movie_Ratings/assets/132225987/342cc04d-1c50-4b79-a906-382b4ed75333)

## 8. Conclusion
In the pursuit of creating a robust Movie Rating Prediction Model, our team has undertaken a comprehensive journey, combining data from [OMDb API](https://www.omdbapi.com/) and [The Numbers](https://www.the-numbers.com/) to build a machine learning model tailored for filmmakers. The goal is to provide valuable insights into predicting movie ratings for both general viewers and specific user scenarios.

Our Movie Rating Prediction Model combines meticulous data collection, thorough exploratory analysis, and robust machine learning to provide actionable insights for both Movie Makers and Viewers. Both Writer and Director ratings emerged as key predictors, emphasizing the impact of artistic leadership on a film's success. The integration of Tableau analysis adds depth to our understanding, revealing interesting nuances in Writer Ratings. As the project evolves, we anticipate refining our models further, embracing new features, and staying attuned to industry dynamics. This journey into data-driven movie insights is a collaborative effort, and we look forward to advancing the intersection of technology and filmmaking.

## 9. Future Directions
As the project evolves, we aim to fine-tune our models, explore additional features, and expand our analysis to cater to evolving trends in the dynamic realm of movie production. This journey into data-driven movie insights is a collaborative effort, and we look forward to advancing the intersection of technology and filmmaking.

## 10. Contributors
+ Rebekah Aldrich [GitHub](https://github.com/vt-bekah) | [LinkedIn](https://www.linkedin.com/in/rebekah-aldrich-13103219/)
+ Christopher Hornung [GitHub](https://github.com/cjhornung) | [LinkedIn](https://www.linkedin.com/in/christopherjhornung/)
+ Alejandro Davila [GitHub](https://github.com/alejandro-davila) | [LinkedIn](https://www.linkedin.com/in/alejandro-davila-61845b1b/)
+ Ashley Ley [GitHub](https://github.com/ashley-ley) | [LinkedIn](https://www.linkedin.com/in/ashley-ley1/)
+ Bryant Griessel [GitHub](https://github.com/demzilla) [LinkedIn](https://www.linkedin.com/in/bryant-griessel-6630a0185/)

## 11. File Structure
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
