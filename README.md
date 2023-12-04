*Note:* It was fun to learn OOP in the process of creating this project.

# College Football Play-by-Play Simulation

## Overview
This project simulates college football games at a play-by-play level. It modifies existing methodology and code from Reddit user *FireBoop* that simulates NFL games (https://www.reddit.com/r/nfl/comments/ew9dog/comment/fg20mw0/) and expands it to incorporate the offensive players involved in each play. The purpose of this college football simulation was to determine the true distribution of fantasy points for use in daily fantasy lineup optimization. Proprietary simulations exist, but I wanted to achieve similar results at a fraction of the *financial* cost. A tremendous amount of work goes into developing these simulations because football is a complex sport, and lineup optimization adds another level of complexity to the project. 

## Getting Started
The first step was to code the logic and game rules for the football simulation. I copied *FireBoop*'s game simulation code and modified it in areas where college football differs from the NFL. Also similar to his methodology, I handled data processing in a separate file (organize_data.py). The cfbfastR package pulls data from a vast database so it was crucial to organize the processing part of the project. The predictors.py file organizes the machine learning model code that is called in the main simulation file.

## Predictive Models
Continuing to build on *FireBoop*'s code, I deployed several machine-learning models that interacted with one another to determine the result of each play. For example, a logistic regression determined whether each offensive play was a run or a pass. A linear regression determined the yards gained on each play based on whether it was a run or a pass and other contextual variables like down, distance, and field position. Also, a Hierarchical model determined the time of each play based on variables such as yards gained and run/pass. The models were trained on play-by-play data since 2018. They all worked together to attempt to simulate the number of plays in a football game.

## Project Structure
- Load play-by-play data since 2018 using R
- organize_data.py handles data processing
- Play-by-play simulation
    - Game class handles game rules, plays, and calls machine learning models from predictors.py
    - Player class and subclasses update player stats and calculate fantasy points
    - PlayerLoader class gets only the players on a given slate of games using an external data source
    - PlayerUsageManager handles historical player usage data also pulled from cfbfastR; these inputs help determine the probability that an offensive player is involved in a play
    - GameSimulator class pulls everything together and simulates each game in the slate 'n' times and outputs fantasy statistics

## Technologies Used
- R : loads large amount of data using the built-in methods of the cfbfastR package
- Python : object-oriented programming code to build play-by-play simulation, organize data from R load, and generate optimal lineups for daily fantasy
    - pandas, numpy, and statsmodels libraries

## Future Work
### Improve Models
The simulation has not yet accounted for team strength which is a huge necessity. Advanced metrics such as expected points added per play, success rate, and a predictive team elo score are potential influential variables that could be added to the yards gained model. I want to get the game results to a point where the median outcome is close to Vegas team totals. 

### Improve code efficiency
The number of simulations needed to produce a true distribution of outcomes is very large. Currently, one simulation of a slate of games (1-14 games at a time) takes a minute to several minutes to run. I hope to utilize parallel processing to speed up the run time.

### Handle missing data
Injuries and player name variations across data sources cause issues. Accounting for player injuries means I have to manually adjust player usage i.e. give an injured player's rushing volume to the backup running back. The ultimate goal of this project was to reduce my financial *and* mental costs. Projection sites are worth the value because they do this error-handling work. Automating tedious tasks like this is necessary so I can spend my time building daily fantasy lineups.

### Improve outputs
Each simulation produces a set of actual game statistics. Currently, I send the results to an excel file, but I imagine there is a better way to do this in such a way to easily access and summarize the data.
