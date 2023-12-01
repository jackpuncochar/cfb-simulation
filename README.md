*Note* This was the first time I used object-oriented programming. I felt it was extremely necessary for the complexity of this project, and it was fun to learn OOP in the process of creating this.

# College Football Play-by-Play Simulation

## Overview
This project simulates college football games at a play-by-play level. It modifies existing methodology and code that simulates NFL games (https://www.reddit.com/r/nfl/comments/ew9dog/comment/fg20mw0/) and expands it to incorporate the offensive players involved in each play. The purpose of this college football simulation was to determine the true distribution of fantasy points to use in daily fantasy lineup optimization. Proprietary simulations exist, but I wanted to achieve similar results at a fraction of the *financial* cost. A tremendous amount of work goes into developing these simulations because football is a complex sport, and lineup optimization adds another level of complexity to the project. 

## Getting Started
There were several steps involved in this project worked on simultaneously. The first step was to code the logic and game rules for the football simulation. I pretty much copied the above Reddit user's game simulation code, modifying it in areas where college football differs from the NFL. Also, it was necessary to handle data processing in a separate file. Similar to the Reddit user's experience with the nflfastR package, I had to process data from the cfbfastR package so that it would be useful in the machine-learning models that formed the basis of the simulation.

## Predictive Models
Several linear and logistic regression models interacted with one another and determined the result of each play. For example, I used a logistic regression to determine whether each offensive play was a run or a pass. I used linear regression to determine the yards gained on each play based on whether it was a run or a pass and other contextual variables like down, distance, and field position. I also used a Hierarchical Distribution to determine the time of play based on variables such as yards gained and run/pass. The accuracy of this model was important to get a true distribution of offensive plays per game.

## Project Structure


## Technologies Used
