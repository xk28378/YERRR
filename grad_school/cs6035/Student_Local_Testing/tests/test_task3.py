import unittest
import pandas as pd
import os
import sys

if os.path.split(os.getcwd())[-1]=="Student_Local_Testing":
    folder_loc="main"
    sys.path.append(os.getcwd())
    from src.task3 import *
    from tests.utils import *
elif os.path.split(os.getcwd())[-1]=="tests":
    folder_loc="tests"
    sys.path.append(os.path.abspath(os.path.join(os.getcwd(),"..")))
    from src.task3 import *
    from tests.utils import *
else:
    raise Exception(f"Running Tests from `{os.path.split(os.getcwd())[-1]}`. Please run the tests with your CWD set to either Student_Local_Testing or tests folders")

class TestKMeansClustering(unittest.TestCase):
        def setUp(self):
            if folder_loc=="main":
                # Inputs
                self.kmeans_train_dataset = pd.read_csv(os.path.join(os.getcwd(),"task3", "wine_train_features.csv"))
                self.kmeans_test_dataset = pd.read_csv(os.path.join(os.getcwd(),"task3", "wine_test_features.csv"))
                # Answers
                self.kmeans_train_cluster_ids = pd.read_csv(os.path.join(os.getcwd(),"task3", "ktrain_cluster_ids.csv"))
                self.kmeans_test_cluster_ids = pd.read_csv(os.path.join(os.getcwd(),"task3", "ktest_cluster_ids.csv"))
                self.kmeans_test_feat_ans = pd.read_csv(os.path.join(os.getcwd(),"task3", "kmeans_test_feat_df.csv"))
                self.kmeans_train_feat_ans = pd.read_csv(os.path.join(os.getcwd(),"task3", "kmeans_train_feat_df.csv"))
            else:
                # Inputs
                self.kmeans_train_dataset = pd.read_csv(os.path.join(os.getcwd(),"..","task3", "wine_train_features.csv"))
                self.kmeans_test_dataset = pd.read_csv(os.path.join(os.getcwd(),"..","task3", "wine_test_features.csv"))
                # Answers
                self.kmeans_train_cluster_ids = pd.read_csv(os.path.join(os.getcwd(),"..","task3", "ktrain_cluster_ids.csv"))
                self.kmeans_test_cluster_ids = pd.read_csv(os.path.join(os.getcwd(),"..","task3", "ktest_cluster_ids.csv"))
                self.kmeans_test_feat_ans = pd.read_csv(os.path.join(os.getcwd(),"..","task3", "kmeans_test_feat_df.csv"))
                self.kmeans_train_feat_ans = pd.read_csv(os.path.join(os.getcwd(),"..","task3", "kmeans_train_feat_df.csv"))
            
            self.random_state = 42
            self.kmc = KmeansClustering(self.random_state)


        def test_kmeans_train(self):
            self.kmc.train_ids = self.kmc.kmeans_train(self.kmeans_train_dataset)
            self.assertTrue(compare_submission_to_answer(self.kmc.train_ids,list(self.kmeans_train_cluster_ids['K Train Cluster IDS']),"Kmeans Train Cluster IDs"))

        def test_kmeans_test(self):
            _ = self.kmc.kmeans_train(self.kmeans_train_dataset)
            self.kmc.test_ids = self.kmc.kmeans_test(self.kmeans_test_dataset)
            self.assertTrue(compare_submission_to_answer(self.kmc.test_ids,list(self.kmeans_test_cluster_ids['K Test Cluster IDS']),"Kmeans Test Cluster IDs"))

        def test_train_add_kmeans_cluster_id_feature(self):
            self.assertTrue(compare_submission_to_answer_df(self.kmc.train_add_kmeans_cluster_id_feature(self.kmeans_train_dataset),self.kmeans_train_feat_ans,"Kmeans Train DF"))

        def test_test_add_kmeans_cluster_id_feature(self):
            _ = self.kmc.kmeans_train(self.kmeans_train_dataset)
            self.assertTrue(compare_submission_to_answer_df(self.kmc.test_add_kmeans_cluster_id_feature(self.kmeans_test_dataset),self.kmeans_test_feat_ans,"Kmeans Test DF"))

if __name__ == '__main__':
     unittest.main()

