# G5055_Practicum_Project2 | Fall 2021 

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)


**Team Members (in alphabetical order)**

* **Core Team**: Qinyue Hao, Jasmine Hwang, Dan Li, Peishan Li, Rina Shin, Connie Xu, Hanyu Zhang
* **Supporting Team**: Zhiwen Huang, Cara Latinazo, Xingchen Li, Soobin Oh, Lizabeth Singh, Mengying Xu, Tianqing Zhou


## Project Description

This project is developed by graduate students in the Social Sciences program of Columbia University in collaboration with the UN SDG Fund. The objectives of this project was to develop models that could define and quantitatively measure the networks among the 17 Sustainable Development Goals (SDG). To do this we built two models, one text model based on indicator descriptions from UN SDG Indicator Metadata, and coefficient networks based on coefficients calculated using UN SDG Indicator Database. The team also looked at the similarity between the two models, and the generalizability of the network model from the two example countries. 

The importance of this project lies in the context that the different domains of SDGs are interconnected and cannot be effectively resolved without being considered as interdependent, and the fact that although this networks should be both theoretical and evidence-based, few research have been conducted to validate their empirial groundings.

Additional information about the project can be found on the project slides [here](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/G5055%20Project%202%20Deck%20.pdf)

Team member contact information can also be found on the slides.

## Scoping and Methodologies:

### Scoping: 
For the coefficient model, we selected two specific countries: Indonesia and Guatemala.

The two countries were chosen considering countries of interest from the UN Joint SDG Fund, geographical distribution differences, similarities in factors such as population density, political stability, etc., as well as relative data availability.

For the coefficient model, the team is looking at data starting from 2012 to 2020.

### Model Methodologies Used: 

1. Text Model: Network Model based on cosine similarities between indicator descriptions from [SDG metadata](https://unstats.un.org/sdgs/metadata/) 

2. Coefficient Social Network Model: Positive and Negative Network Models based on coefficients for year-to-year changes in [SDG indicator measures](https://unstats.un.org/sdgs/UNSDG/IndDatabasePage)
	- Positive Network

3. QAP Analysis: Calculation of similarity and associations between text and network models. 

## Final Deliverables

1. [Blog](https://docs.google.com/presentation/d/1zmhJTMVDWkgyJlh7xcl0nNyeMsjiqfmjNm4FKSYFkJ4/edit)

2. [Research Paper](https://docs.google.com/document/d/1r9EB9jqlAU1O_vVY4bYghDMNJcdc4Olw/edit)

3. [Interactive Visualizations](http://rpubs.com/LPS/unsdginteractivenetworks)

4. **The team's key findings including other visualization works could be seen the team's [final presentation slides](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/G5055%20Project%202%20Deck%20.pdf).**

## Repository Directory Contents: 

	├── Codes
		├── Composite (1b) 
		├── Correlation Analysis (1c) 
		├── Data Accessing and Preprocessing (1a)
		├── Data Visualization (4)
			├── coefficient network 
			├── text network 
			├── data missingness and disaggregation 
		├── Pick Central Variable (1) ^^ 
		├── Regression Models (3) 
		├── Text Model (2) 
		
	├── Data  
		├── Centrality_representative_results (1) ^^ 
			├── centrality_scores(after removing disaggregation)
			├── indicator_picked(before removing disaggregation)
			├── measure_picked(before removing disaggregation)
		├── Guatemala & Indonesia Correlation among Indicators (1) ^^
		├── Guatemala & Indonesia Correlation among Targets (1) ^^
		├── Guatemala & Indonesia Correlation among measurements (1) ^^ 
		├── Guatemala & Indonesia Correlation among measurements-WITHOUT disaggregation ^^ (1) 
		Guatemala & Indonesia Correlation among Targets Ungrouped.csv ^^
		Indonesia.csv & Guatemala.csv ^^
		Guatemala & Indonesia data after selecting one measurement for each indicator.csv ^^
		Guatmala & Indonesia Data Without Disaggregation.csv ^^
		├── variable_types (1) ^^
		├── variables_picked (1) ^^
		├── List of indicators (1) 
		├── Data_preprocessed_for_PCA (1) 
		├── PCA_results (1) 
		├── coefficient_network (1) ^^

		├── SDG-indicator-metadata (2) 
		├── Text_Model_Data (2) 
		├── Voluntary National Reviews (2) ^^ 

	├── Literature

	├── Visualizations 
		├── Disaggregated_Data (1a) 
		├── Missing_Data (1a) 
		├── Model_Viz (1c) 	
		├── Interactive	(1c) 	 
		├── Text_Model_Viz (2) 
		├── goal_hexcodes_edge.csv 
		├── goal_hexcodes.csv
	
	^^ - item is likely deprecated 
	(1), (2), (1 & 2) - refers to model that the folder is corresponding to. 

### Codes

1. Text Model

2. Coefficient Social Network Model

* [UN_SDG_2_Functions.py](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Data%20Accessing%20and%20Preprocessing/UN_SDG2_Functions.py) This python package includes a function called **preprocess**. If users ```import UN_SDG_2_Functions```, read an SDG file (2012-2021) CSV from the API, they can use this function to directly pivot data into indicator metric / time (year) format. 

3. QAP Analysis

4. Data Visualization


**Preprocessed data:**

1. Text Model

2. Coefficient Social Network Model

* Indonesia.csv: contains data of UN SDG Indicators for Indonesia from 2012 to 2021 (Output from [the code](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Data%20Accessing%20and%20Preprocessing/Accessing_UNSDG_Data.ipynb))
* Guatemala.csv: contains data of UN SDG Indicators for Guatemala from 2012 to 2021 (Output from [the code](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Data%20Accessing%20and%20Preprocessing/Accessing_UNSDG_Data.ipynb))

3. QAP Analysis

*Note: If users have feedback, please feel free to contact our team with questions, issues, and concerns.* 
