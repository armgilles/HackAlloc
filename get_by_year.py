# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 18:58:06 2015

@author: GILLES ARMAND
"""


import pandas as pd

year = ['2009', '2010', '2011', '2012', '2013', '2014']

for my_year in year:
    print my_year
    path_rsa = 'source/by_commune/RSACom' + str(my_year) + '.csv' 
    path_paje = 'source/by_commune/PAJECom' + str(my_year) + '.csv' 
    
    paje = pd.read_csv(path_paje, sep=";")
    paje.rename(columns={'NB_Allocataires':'paje_NB_allocataires'}, inplace=True)
    rsa = pd.read_csv(path_rsa, sep=";")
    rsa.rename(columns={'NB_allocataires':'rsa_NB_allocataires'}, inplace=True)
    
    df = pd.merge(paje, rsa, how='inner', on='Codes_Insee')
    df = df[['Codes_Insee', u'paje_NB_allocataires', u'ALL_PAJE',
             u'ALL_PRIM', u'ALL_BASEP', u'ALL_ASMA', u'ALL_Clca_Colca',
             u'rsa_NB_allocataires', u'NB_allocataire_RSA',
             u'Dont_RSA_jeune', u'RSA_SOCLE_non_Majore', u'RSA_SOCLE_Majore',
             u'RSA_activite']]
             
    output = 'data/caf_' + str(my_year) + '.csv'
    df.to_csv(output, encoding='utf-8', index=False)