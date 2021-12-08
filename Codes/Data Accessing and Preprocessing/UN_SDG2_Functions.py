import pandas as pd 
import numpy as np 
import requests
import json
from pprint import pprint 
import itertools, functools, operator
import country_converter as coco

def obtain_indicator_data(country): 
    geo_area_code = coco.convert(names=str(country), to='UNcode')
    
    headers={
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/octet-stream',
    }
    
    data=[
      ('goal', '1'),
      ('goal', '2'),
      ('goal', '3'),
      ('goal', '4'),
      ('goal', '5'),
      ('goal', '6'),
      ('goal', '7'),
      ('goal', '8'),
      ('goal', '9'),
      ('goal', '10'),
      ('goal', '11'),
      ('goal', '12'),
      ('goal', '13'),
      ('goal', '14'),
      ('goal', '15'),
      ('goal', '16'),
      ('goal', '17'),
      ('areaCodes', str(geo_area_code)),
      ('timePeriodStart', '2012'),
      ('timePeriodEnd', '2022'),
    ]
    
    tocsv=requests.post('https://unstats.un.org/SDGAPI/v1/sdg/Goal/DataCSV', headers=headers, data=data)
    country_content=tocsv.content
    csv_name = country + ".csv"

    csv_file = open(csv_name, 'wb')
    csv_file.write(country_content)
    csv_file.close()
    
# This function is designed to generate a unique ID and transform data into a year format. 
def preprocess(df): 
    df_copy  = df.copy()

    # If a column with unique identifying info has nothing, we then will have blanks for those fields - otherwise concatenating the text will be NanNan etc. 
    df_copy = df_copy.fillna('')

    # Concatenated Column with a number of identifiers 
    df_copy['UniqueID'] = df_copy[['SeriesCode','[Sex]',\
                                   '[Deviation Level]', '[Mountain Elevation]',\
                                   '[Parliamentary committees]', '[Mode of transportation]',\
                                   '[Type of speed]', '[Policy instruments]', '[Type of skill]',\
                                   '[Education level]', '[Location]', '[Food Waste Sector]',\
                                   '[Freq]', '[Type of product]', '[Observation Status]',\
                                   '[Type of occupation]','[Name of non-communicable disease]', '[Level/Status]',\
                                   '[Age]', '[Disability status]','[Frequency of Chlorophyll-a concentration]',\
                                   '[Activity]', '[Level of requirement]', '[Quantile]',\
                                   '[IHR Capacity]','[Name of international institution]'\
                                  ]].apply(lambda x: ' '.join(x), axis=1)
    duplicates = df_copy[df_copy.duplicated(subset=['UniqueID','Goal', 'Target', 'Indicator',\
                                      'SeriesCode', 'SeriesDescription','Source','TimePeriod'])]
    duplicates # if you print duplicates (outside of this function) you will find a small number of duplicate columns; 
    # however when I looked at them, the values were largely consistent - the only differing column I could find was Value. 
    # Let me know if you think this should be done differently. 
    
    # For the time being I will remove columns that are duplicates across all columns (less that of 'Values')
    df_copy = df_copy[['UniqueID','Source','Goal', 'Target', 'Indicator', 'SeriesCode', 'SeriesDescription','[Units]','[Nature]',
       'GeoAreaCode', 'GeoAreaName', 'Time_Detail', 'Value','[Reporting Type]','TimePeriod']].drop_duplicates(subset = ['UniqueID','Source','Goal', 'Target', 'Indicator', 'SeriesCode', 'SeriesDescription','[Units]','[Nature]',
       'GeoAreaCode', 'GeoAreaName', 'Time_Detail','[Reporting Type]','TimePeriod'])
    # Pivot on year. 
    df_copy_pivot = df_copy.pivot(index=['UniqueID','Goal', 'Target', 'Indicator',\
                                      'SeriesCode', 'SeriesDescription','Source'], columns=['TimePeriod'],values='Value').reset_index()
    
    return df_copy_pivot
