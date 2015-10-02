# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 19:28:35 2015

@author: GILLES Aramnd
"""

import pandas as pd
import numpy as np
from sklearn.cluster import KMeans



test = pd.read_csv('data/commune_insee.csv')

df = test[test.DEP.isin(['76', '27'])].reset_index(drop=True)

features = df.columns.tolist()

# unusefull col
for col in ["LIBCOM","REG","DEP"]:
    features.remove(col)

# key
features.remove('COM')

df.fillna(value=0, inplace=True)

X = df[features].values

# PCA Transformation
from sklearn.decomposition import PCA

pca = PCA(n_components=2).fit(X)
X_pca = pca.transform(X)
X = X_pca; print "PCA transformation"; pca_bool = 1

k_means = KMeans(init='k-means++', n_clusters=3, n_init=10).fit(X)

k_means_labels = k_means.labels_
k_means_cluster_centers = k_means.cluster_centers_
k_means_labels_unique = np.unique(k_means_labels)

df['cluster'] = pd.Series(k_means_labels)


## Plot result
import matplotlib.pyplot as plt
#from mpl_toolkits.mplot3d import Axes3D
#
#from itertools import cycle
#
#colors = cycle('bgrcmykbgrcmykbgrcmykbgrcmyk')
#fig = plt.figure().gca(projection='3d')
#
#if pca_bool == 0: # If no PCA transforamtion DO classic feature name
#    fig.set_xlabel('Number of entries by day')
#    fig.set_ylabel('Number of differents station')
#    fig.set_zlabel('Mean time by run')
#else: # If PCA transformation rename axes.
#    fig.set_xlabel('First PCA direction')
#    fig.set_ylabel('Seconde PCA direction')
#    fig.set_zlabel('Three PCA direction')
#
#
#for k, col in zip(range(k_means.n_clusters), colors):
#    my_members = k_means_labels == k
#    cluster_center = k_means_cluster_centers[k]
#    fig.scatter(X[my_members, 0], X[my_members, 1], X[my_members, 2], color=col,
#             marker='.', alpha=0.5)
#
##for k, col in zip(range(k_means.n_clusters), colors): 
#fig.plot(k_means_cluster_centers[:, 0], k_means_cluster_centers[:, 1], k_means_cluster_centers[:, 2], 
#         '+', color='k', markersize=8)
#       
#plt.title('Estimated number of clusters: %d' % k_means.n_clusters)
#plt.show()




colors = ['#ffdab9','#a2bf6b','#8b0000']
for k, col in zip(range(k_means.n_clusters), colors):
    my_members = k_means_labels == k
    cluster_center = k_means_cluster_centers[k]
    plt.scatter(X[my_members, 0], X[my_members, 1], color=col,
             marker='.', alpha=0.9)
    plt.plot(k_means_cluster_centers[:, 0], k_means_cluster_centers[:, 1], 
         '+', color='k', markersize=8)
plt.title('K-means Clustering for %d Cluster with PCA decomposition' % k_means.n_clusters)
plt.xlabel('First PCA direction')
plt.ylabel('Seconde PCA direction')
