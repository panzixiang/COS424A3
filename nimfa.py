
# coding: utf-8

# In[ ]:

get_ipython().magic(u'matplotlib inline')
get_ipython().magic(u'pylab inline')
pylab.rcParams['figure.figsize'] = (20, 5)

import numpy as np
import pandas as pd
from sklearn.decomposition import TruncatedSVD
from scipy.sparse import csr_matrix
from scipy.sparse.linalg import svds
from sklearn.metrics import roc_curve, auc

dftrain = pd.read_csv('txTripletsCounts.txt',
                      header=None,
                      index_col=None,
                      sep=' ',
                      names=['sender','receiver','transaction'])
dftrain['transaction'].describe()

import nimfa

#W=csr_matrix()

snmf = nimfa.Snmf(csr_matrix(dftrain),seed="random_c", rank=10, max_iter=12, version='r', eta=1.,
                  beta=1e-4, i_conv=10, w_min_change=0)

snmf.factorize()

W=snmf.basis();
H=snmf.coef();

