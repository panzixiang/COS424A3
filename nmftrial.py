import numpy as np
import pandas as pd
import csv
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


dftest = pd.read_csv('data/testTriplets.txt',
                     header=None, 
                     index_col=None, 
                     sep=' ', 
                     names=['sender','receiver','transaction'])

train_csr = csr_matrix((dftrain['transaction'],(dftrain['sender'],dftrain['receiver'])),
                                       shape=(444075,444075), dtype=float)

test_csr = csr_matrix((dftest['transaction'],(dftest['sender'],dftest['receiver'])),
                                       shape=(444075,444075), dtype=float)





model = NMF(n_components=10, init='random', random_state=0, tol=0.01)
W = model.fit_transform(csr_matrix(train_csr))
H = model.components_

print W.shape
print H.shape
pred = []

for index, row in dftest.iterrows():
        pred.append(np.dot(W[row['sender'],:],H[:,row['receiver']]))


with open('pred','w') as f1:
        wrtest = csv.writer(f1, quoting=csv.QUOTE_NONNUMERIC,lineterminator='\n')
        wrtest.writerow(pred)
