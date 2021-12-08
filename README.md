# G5055_Practicum_Project2

**Team Members (in alphabetical order)**

* **Core Team**: Qinyue Hao, Jasmine Hwang, Dan Li, Peishan Li, Rina Shin, Connie Xu, Hanyu Zhang
* **Supporting Team**: Zhiwen Huang, Cara Latinazo, Xingchen Li, Soobin Oh, Lizabeth Singh, Mengying Xu, Tianqing Zhou

## Project Description

This project is developed by graduate students in the Social Sciences program of Columbia University in collaboration with the UN SDG Fund. The objectives of this project is to develop models that could define and quantitatively measure the networks among the 17 Sustainable Development Goals (SDG). To do this we built two models, one text model based on indicator descriptions from UN SDG Indicator Metadata, and coefficient networks based on coefficients calculated using UN SDG Indicator Database. The team also looks at the similarity between the two models, and the generalizability of the network model from the two example countries. The importance of this project lies in the context that the different domains of SDGs are interconnected and cannot be effectively resolved without being considered as interdependent, and the fact that although this networks should be both theoretical and evidence-based, few research have been conducted to validate their empirial groundings.

Languages used include Python and R.

Additional information about the project can be found on the project slides [here](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/G5055%20Project%202%20Deck%20.pdf)

Team member contact information can also be found on the slides.

## Project Scope

For the coefficient model chooses two specific countries, Indonesia and Guatemala.

The two countries were chosen considering countries of interest from the UN Joint SDG Fund, geographical distribution differences, similarities in factors such as population density, political stability, etc., as well as relative data availability.

For the coefficient model, the team is looking at data starting from 2012 to 2020.

## Model Methodlogies (Pending)

1. Text Model

2. Coefficient Social Network Model

3. QAP Analysis

## Final Deliverables

1. [Blog](https://docs.google.com/presentation/d/1zmhJTMVDWkgyJlh7xcl0nNyeMsjiqfmjNm4FKSYFkJ4/edit)

2. [Research Paper](https://docs.google.com/document/d/1r9EB9jqlAU1O_vVY4bYghDMNJcdc4Olw/edit)

3. [Interactive Visualizations](http://rpubs.com/LPS/unsdginteractivenetworks)

4. **The team's key findings including other visualization works could be seen the team's [final presentation slides](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/G5055%20Project%202%20Deck%20.pdf).**

## User Guide for the Repository (Pending)

### Codes

1. Text Model

2. Coefficient Social Network Model

* [UN_SDG_2_Functions.py](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Data%20Accessing%20and%20Preprocessing/UN_SDG2_Functions.py) This python package includes a function called **preprocess**. If users ```import UN_SDG_2_Functions```, read an SDG file (2012-2021) CSV from the API, they can use this function to directly pivot data into indicator metric / time (year) format. 

3. QAP Analysis

4. Data Visualization

### Data

**Original data sources include:**

* [UN SDG Indicators](https://unstats.un.org/sdgs/indicators/database/)
* [UN SDG Indicator Metadata](https://unstats.un.org/sdgs/metadata/)

**Preprocessed data:**

1. Text Model

2. Coefficient Social Network Model

* Indonesia.csv: contains data of UN SDG Indicators for Indonesia from 2012 to 2021 (Output from [the code](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Data%20Accessing%20and%20Preprocessing/Accessing_UNSDG_Data.ipynb))
* Guatemala.csv: contains data of UN SDG Indicators for Guatemala from 2012 to 2021 (Output from [the code](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Data%20Accessing%20and%20Preprocessing/Accessing_UNSDG_Data.ipynb))

3. QAP Analysis

*Note: If users have feedback, please feel free to contact our team with questions, issues, and concerns.* 
