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

1. Text Model: Network Model based on TF-IDF and cosine similarities between indicator descriptions from [SDG metadata](https://unstats.un.org/sdgs/metadata/) 

2. Coefficient Social Network Model: Whole Network, Positive and Negative Network Models based on coefficients for year-to-year changes in [SDG indicator measures](https://unstats.un.org/sdgs/UNSDG/IndDatabasePage)
	- Whole Network: An undirected, weighted network. All availalable indicators as nodes, statistically significant(p < 0.05) relationships as ties, and the corresponding correlation coefficents as weights of ties.
	- Positive Network: A subgraph of the whole network, with only the positive linkages and the indicators they connect.
	- Negative Network: A subgraph of the whole network, with only the negative linkages and the indicators they connect.

3. QAP Procedure and Network Logistic Regression : [QAP (Quadratic Assignment Procedure) procedure](https://www.stata.com/meeting/1nasug/simpson.pdf) is a way to handel non-independence problem by permuting rows and columns in the matrix, while maintaining the underlying relationship. To focus on predicting the existence rather than the strength of ties, we made the positive and negative network models binary by recoding all the coefficients to 1, before doing Network Logistic Regression between them, to test for the predcitive strength of one network on another.

## Final Deliverables

1. [Blog](https://docs.google.com/presentation/d/1zmhJTMVDWkgyJlh7xcl0nNyeMsjiqfmjNm4FKSYFkJ4/edit)

2. [Research Paper](https://docs.google.com/document/d/1r9EB9jqlAU1O_vVY4bYghDMNJcdc4Olw/edit)

3. [Interactive Visualizations](http://rpubs.com/LPS/interactivevisualizations)

4. **See key findings and other visualizations on the [final presentation slides](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/G5055%20Project%202%20Deck%20.pdf).**

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

		├── Text_Model_Data (2) 

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

* [three_models.ipynb](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Text%20Model/three_models.ipynb) shows the use of three word embedding models TF-IDF, Word2vec and Doc2vec and their results.
* [25sample_indicator.ipynb](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Text%20Model/25sample_indicator.ipynb) is the sampling process for the three models' results to decide the final model.
* [tf_idf_final.ipynb](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Text%20Model/tf_idf_final.ipynb) represents the final result using TF-IDF.

2. Coefficient Social Network Model

* [UN_SDG_2_Functions.py](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Data%20Accessing%20and%20Preprocessing/UN_SDG2_Functions.py) This python package includes a function called **preprocess**. If users ```import UN_SDG_2_Functions```, read an SDG file (2012-2021) CSV from the API, they can use this function to directly pivot data into indicator metric / time (year) format. 

3. QAP Analysis
* [QAP_regression_sig.Rmd](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Regression%20Models%20/QAP_regression_sig.Rmd) This Rmd shows the process of regressions between different networks with OLS Network models and Network Logistic Models.

4. Data Visualization
* [final_viz_weighted_net.R](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Data%20Visualization/coefficient%20network/final_viz_weighted_net.R) Visualization of static indicator network built with correlation coefficients.

**Data pre-processing:**

1. Text Model

* [fill_definition_incomplete.ipynb](https://github.com/PeishanLi/G5055_Practicum_Project2/blob/main/Codes/Text%20Model/fill_definition_incomplete.ipynb) shows the process of scraping the 246 indicators' definitions from the metadata PDF files. 

2. Coefficient Social Network Model

* Indonesia.csv: contains data of UN SDG Indicators for Indonesia from 2012 to 2021
* Guatemala.csv: contains data of UN SDG Indicators for Guatemala from 2012 to 2021


*Note: If users have feedback, please feel free to contact our team with questions, issues, and concerns.* 
