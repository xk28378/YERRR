import unittest
import pandas as pd
import os
import sys

if os.path.split(os.getcwd())[-1]=="Student_Local_Testing":
    folder_loc="main"
    sys.path.append(os.getcwd())
    from src.task_video import (NaiveBayes, ModelMetrics)
elif os.path.split(os.getcwd())[-1]=="tests":
    folder_loc="tests"
    sys.path.append(os.path.abspath(os.path.join(os.getcwd(),"..")))
    from src.task_video import (NaiveBayes, ModelMetrics)
else:
    raise Exception(f"Running Tests from `{os.path.split(os.getcwd())[-1]}`. Please run the tests with your CWD set to either Student_Local_Testing or tests folders")

 
class Test_calculate_Naive_Bayes(unittest.TestCase):
    def setUp(self):
        # Train and Test Data is derived from http://archive.ics.uci.edu/dataset/186/wine+quality
        if folder_loc=="main":
            # Inputs
            self.train_features = pd.read_csv(os.path.join(os.getcwd(),"task4","wine_train_features.csv"), index_col=0)
            self.test_features  = pd.read_csv(os.path.join(os.getcwd(),"task4","wine_test_features.csv"), index_col=0)
            self.train_targets  = pd.read_csv(os.path.join(os.getcwd(),"task4","wine_train_targets.csv"), index_col=0)
            self.test_targets   = pd.read_csv(os.path.join(os.getcwd(),"task4","wine_test_targets.csv"), index_col=0)
        else:
            # Inputs
            self.train_features = pd.read_csv(os.path.join(os.getcwd(),"..","task4","wine_train_features.csv"), index_col=0)
            self.test_features  = pd.read_csv(os.path.join(os.getcwd(),"..","task4","wine_test_features.csv"), index_col=0)
            self.train_targets  = pd.read_csv(os.path.join(os.getcwd(),"..","task4","wine_train_targets.csv"), index_col=0)
            self.test_targets   = pd.read_csv(os.path.join(os.getcwd(),"..","task4","wine_test_targets.csv"), index_col=0)

        # Answers for Wine Dataset
        self.naive_bayes_accuracy_ans = 0.7157
        self.naive_bayes_recall_ans = 0.8143
        self.naive_bayes_precision_ans = 0.7705
        self.naive_bayes_fscore_ans = 0.7918

        self.test_naive_bayes_accuracy_ans = 0.7092
        self.test_naive_bayes_recall_ans = 0.8189
        self.test_naive_bayes_precision_ans = 0.7642
        self.test_naive_bayes_fscore_ans = 0.7906

        self.naive_bayes = NaiveBayes()

        # Calculate Metrics with Student's Function
        self.naive_bayes_metrics = self.naive_bayes.calculate_naive_bayes_metrics()

    def test_naive_bayes_accuracy(self):
        naive_bayes_accuracy = round(self.naive_bayes_metrics.train_metrics["accuracy"], 4)
        self.assertEqual(naive_bayes_accuracy, self.naive_bayes_accuracy_ans)

    def test_naive_bayes_recall(self):
        naive_bayes_recall = round(self.naive_bayes_metrics.train_metrics["recall"], 4)
        self.assertEqual(naive_bayes_recall, self.naive_bayes_recall_ans)

    def test_naive_bayes_precision(self):
        naive_bayes_precision = round(self.naive_bayes_metrics.train_metrics["precision"], 4)
        self.assertEqual(naive_bayes_precision, self.naive_bayes_precision_ans)

    def test_naive_bayes_fscore(self):
        naive_bayes_fscore = round(self.naive_bayes_metrics.train_metrics["fscore"], 4)
        self.assertEqual(naive_bayes_fscore, self.naive_bayes_fscore_ans)

    def test_test_naive_bayes_accuracy(self):
        naive_bayes_accuracy = round(self.naive_bayes_metrics.test_metrics["accuracy"], 4)
        self.assertEqual(naive_bayes_accuracy, self.test_naive_bayes_accuracy_ans)

    def test_test_naive_bayes_recall(self):
        naive_bayes_recall = round(self.naive_bayes_metrics.test_metrics["recall"], 4)
        self.assertEqual(naive_bayes_recall, self.test_naive_bayes_recall_ans)

    def test_test_naive_bayes_precision(self):
        naive_bayes_precision = round(self.naive_bayes_metrics.test_metrics["precision"], 4)
        self.assertEqual(naive_bayes_precision, self.test_naive_bayes_precision_ans)

    def test_test_naive_bayes_fscore(self):
        naive_bayes_fscore = round(self.naive_bayes_metrics.test_metrics["fscore"], 4)
        self.assertEqual(naive_bayes_fscore, self.test_naive_bayes_fscore_ans)