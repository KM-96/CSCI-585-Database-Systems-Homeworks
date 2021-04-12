# Homework 4: Data Mining

## Problem Statement

* In this homework, we worked with three UI-based tools, to carry out data mining: WEKA, KNIME, RapidMiner. 
* Click [here](http://bytes.usc.edu/cs585/s20_db0ds1ml2agi/hw/HW4/index.html) to see the full problem statement from the course website.

## Questions

* The [Boston Housing Dataset]() is a dataset that contains data regarding houses in several Boston suburbs. It has 506 rows (records) of data, and 14 columns (attributes). For this HW, we used the 'MEDV' (median home price) attribute as the "class" (the output to predict). In other words, using existing data from the other 13 columns, we want to be able to learn to predict MEDV for a new record (ie. row) that contains known values for those 13 'input' columns.

### WEKA

#### Question 1 
* Build a linear regression equation, to predict MEDV. Include a screenshot that shows the linear equation. How many terms are in the equation, and 'why'?

#### Question 2 
* Create a 'MultilayerPerceptron' neural network that learns the data. What is the lowest RMSE you are able to achieve?

---
### KNIME
*  [This]() dataset consists of 4177 rows of data regarding abalone shells, where each row resulted from measuring 9 parameters/features/values for each shell.

#### Question 3
*  Use KNIME to perform linear regression [on all parameters, not a subset]. You need these nodes: AARF Reader, Linear Regression Learner. Create and connect the nodes, and execute each. What is the linear equation? 

#### Question 4
* Set up a 'Decision Tree Learner' predictor, where 'sex' is the predicted variable. 

---
### RapidMiner

#### Question 5
* Create 6 clusters with 4 attrs length,diameter,height,num_rings, ie. you'd be clustering a 4D dataset) out of the 4177 pieces of data using a kMeans 'Clustering' node. 
* Question: how many data points are in each cluster? 

#### Question 6
* Do a linear regression to predict num_rings, from length,diameter,height. Question: what is the equation? 

## Contact
If you want to contact me you can reach me at <km69564@usc.edu> or <krishnamanoj14@gmail.com>.