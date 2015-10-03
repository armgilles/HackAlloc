# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 21:17:23 2015

@author: GILLES Armand
"""

import pandas as pd

features_city = ["COM",
                  "LIBCOM",
                  "REG",
                  "DEP",
                  "P11_POP"]

features_insee = [
                "C11_FAM",
                "P11_POP0019",
                "P11_POP2064",
                "P11_POP65P",
                "P11_ACTOCC1564",
                "P11_CHOM1564",
                "RFMQ211"]

use_col = features_city + features_insee
insee = pd.read_csv('data/insee_data.csv', sep=";",
                    dtype={'COM': object,
                           'LIBCOM' : object,
                           'REG': object,
                           'DEP' : object,
                           'P11_POP' : float,
                            "C11_FAM" : float,
                            "P11_POP0019" : float,
                            "P11_POP2064" : float,
                            "P11_POP65P" : float,
                            "P11_ACTOCC1564" : float,
                            "P11_CHOM1564" : float,
                            "RFMQ211" : float},
                    usecols=use_col)

insee.fillna(0, inplace=True)

insee = insee[insee.COM != 0]

# Features to mean other is to sum
features_mean = ['RFMQ211']

# Remove mean's Features to sum's Features
features_sum = features_insee[:] # to copy
for feature in features_mean:
    features_sum.remove(feature)

features_city.remove("P11_POP")

pop_city = insee.groupby('COM')['P11_POP'].sum().reset_index()
pop_city.to_csv('data/ref_pop.csv', encoding='utf-8', index=False)



commune_sum = insee.groupby(features_city)[features_sum].sum().reset_index()
commune_mean = insee.groupby(features_city)[features_mean].mean().reset_index()

features_mean.append('COM') # Key to merge

commune = pd.merge(commune_sum, commune_mean[features_mean], how='inner', on='COM')
commune = pd.merge(commune, pop_city, how='inner', on='COM')


# REMOVE COMMUNE WITH 0 POP

commune = commune[commune.P11_POP != 0]


percent_col = [ 'C11_FAM',
                 'P11_POP0019',
                 'P11_POP2064',
                 'P11_POP65P',
                 'P11_ACTOCC1564',
                 'P11_CHOM1564']

for percent in percent_col:
    commune[percent] = commune.apply(lambda row: (row[percent] * 100) / row.P11_POP, axis=1)
    
commune.to_csv('data/commune_insee.csv', encoding='utf-8', index=False)

