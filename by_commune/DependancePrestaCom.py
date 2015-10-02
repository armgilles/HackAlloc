# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 13:47:48 2015

@author: babou
"""

import pandas as pd
import glob

df = pd.read_csv('../source/by_commune/DependancePrestaCom2009.csv', sep=";")
#df.shape() = (36729, 5)
df.columns = ['Communes', 'Codes_Insee', 'NB_Allocataires_2009', 
              'TR50PFRB_2009', 'TR100PFRB_2009']

files = glob.glob('../source/by_commune/DependancePrestaCom*')

for path_file in files:
    year = str(path_file[-8:-4])
    if (year != '2009'):
        df_temp = pd.read_csv(path_file, sep=';')
        
        # Rename Col with year
        year_col = ['Communes', 'Codes_Insee']
        features_col = []
        for col in df_temp.columns[-3:]:
            year_col.append(col +"_"+ year)
            features_col.append(col +"_"+ year)
        
        # Adding key for mergeing
        features_col.append('Codes_Insee')
        df_temp.columns = year_col
        df = pd.merge(df, df_temp[features_col], how='inner', on='Codes_Insee')

df.to_csv('../data/by_commune/full_DependancePrestaCom.csv', encoding='utf-8')

## Features 
#[u'NB_Allocataires_2009', u'TR50PFRB_2009',
#u'TR100PFRB_2009', u'NB_Allocataires_2010', u'TR50PFRB_2010',
#u'TR100PFRB_2010', u'NB_Allocataires_2011', u'TR50PFRB_2011',
#u'TR100PFRB_2011', u'NB_Allocataires_2012', u'TR50PFRB_2012',
#u'TR100PFRB_2012', u'NB_Allocataires_2013', u'TR50PFRB_2013',
#u'TR100PFRB_2013', u'NB_Allocataires_2014', u'TR50PFRB_2014',
#u'TR100PFRB_2014']

