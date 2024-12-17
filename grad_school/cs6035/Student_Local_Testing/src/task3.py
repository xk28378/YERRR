import numpy as np
import pandas as pd
import sklearn.cluster as skl
import yellowbrick.cluster

class KmeansClustering:
    def __init__(self, 
                 random_state: int
                ):
        # TODO: Add any state variables you may need to make your functions work
        self.random_state = random_state
        self.kmenas = None
        pass

    def kmeans_train(self,train_features:pd.DataFrame) -> list:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task3.html and implement the function as described
        visualizer = yellowbrick.cluster.KElbowVisualizer(skl.KMeans(random_state=self.random_state, n_init=10), k=(1,10))
        visualizer.fit(train_features)
        k = visualizer.elbow_value_
        self.kmeans = skl.KMeans(n_clusters=k, random_state=self.random_state, n_init=10).fit(train_features)
        cluster_ids = self.kmeans.labels_
        return list(cluster_ids)

    def kmeans_test(self,test_features:pd.DataFrame) -> list:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task3.html and implement the function as described
        cluster_ids = self.kmeans.predict(test_features)
        return list(cluster_ids)

    def train_add_kmeans_cluster_id_feature(self,train_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task3.html and implement the function as described
        cluster_ids = self.kmeans_train(train_features)
        train_features['kmeans_cluster_id'] = cluster_ids
        return train_features

    def test_add_kmeans_cluster_id_feature(self,test_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task3.html and implement the function as described
        cluster_ids = self.kmeans_test(test_features)
        test_features['kmeans_cluster_id'] = cluster_ids
        return test_features