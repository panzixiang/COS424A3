import numpy as np
import pandas as pd
from sklearn.decomposition import TruncatedSVD
from sklearn.decomposition import NMF
from scipy.sparse import csr_matrix
from scipy.sparse.linalg import svds
from sklearn.metrics import roc_curve, auc

dftrain = pd.read_csv('txTripletsCounts.txt',
                      header=None,
                      index_col=None,
                      sep=' ',
                      names=['sender','receiver','transaction'])
dftrain['transaction'].describe()


model = NMF(n_components=10, init='random', random_state=0, tol=0.01)
trans = model.fit_transform(csr_matrix(dftrain)) 
