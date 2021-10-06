import pandas as pd 
import numpy as np 

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
