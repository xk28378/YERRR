import unittest
import pandas as pd
import os
import sys

if os.path.split(os.getcwd())[-1]=="Student_Local_Testing":
    folder_loc="main"
    sys.path.append(os.getcwd())
    from src.task2 import *
    from tests.utils import *
elif os.path.split(os.getcwd())[-1]=="tests":
    folder_loc="tests"
    sys.path.append(os.path.abspath(os.path.join(os.getcwd(),"..")))
    from src.task2 import *
    from tests.utils import *
else:
    raise Exception(f"Running Tests from `{os.path.split(os.getcwd())[-1]}`. Please run the tests with your CWD set to either Student_Local_Testing or tests folders")

class TestTrainTestSplit(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"task1","sample.csv"))
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","test_targets_tts.csv")).set_index("index")["target"]
        else:
            self.dataset = pd.read_csv(os.path.join("..","task1","sample.csv"))
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_targets_tts.csv")).set_index("index")["target"]

        self.target_col = "target"
        self.train_features,self.test_features,self.train_targets,self.test_targets = tts(self.dataset,
                            self.target_col, 
                            test_size=.2,
                            stratify=True,
                            random_state=0)
         
    def test_train_features(self):
        self.assertTrue(compare_submission_to_answer_df(self.train_features,self.ans_train_features,"Train Features DF"))
        

    def test_test_features(self):
        self.assertTrue(compare_submission_to_answer_df(self.test_features,self.ans_test_features,"Test Features DF"))

    def test_train_targets(self):
        self.assertTrue(compare_submission_to_answer_series(self.train_targets,self.ans_train_targets,"Train Targets Series"))

    def test_test_targets(self):
        self.assertTrue(compare_submission_to_answer_series(self.test_targets,self.ans_test_targets,"Test Targets Series"))

def double_height(dataframe:pd.DataFrame):
    return dataframe["height"] * 2

class TestOneHotEncoder(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            # Inputs
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_ohe = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_ohe.csv")).set_index("index")
            self.ans_test_features_ohe = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_ohe.csv")).set_index("index")
        else:
            # Inputs
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_ohe = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_ohe.csv")).set_index("index")
            self.ans_test_features_ohe = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_ohe.csv")).set_index("index")
        self.target_col = "target"
        self.preprocessDataset = PreprocessDataset(
                       one_hot_encode_cols = ["color","version"],
                       min_max_scale_cols = ["cost"],
                       n_components = 2,
                       feature_engineering_functions = {"double_height":double_height})
        
    def test_train_features_ohe(self):
        train_features_ohe = self.preprocessDataset.one_hot_encode_columns_train(train_features = self.ans_train_features)
        self.assertTrue(compare_submission_to_answer_df(train_features_ohe,self.ans_train_features_ohe,"One Hot Encoded Train DF"))

    def test_test_features_ohe(self):
        _ = self.preprocessDataset.one_hot_encode_columns_train(train_features = self.ans_train_features)
        test_features_ohe = self.preprocessDataset.one_hot_encode_columns_test(test_features = self.ans_test_features)
        self.assertTrue(compare_submission_to_answer_df(test_features_ohe,self.ans_test_features_ohe,"One Hot Encoded Test DF"))

class TestMinMaxScaler(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            # Inputs
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_mms = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_mms.csv")).set_index("index")
            self.ans_test_features_mms = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_mms.csv")).set_index("index")
        else:
            # Inputs
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_mms = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_mms.csv")).set_index("index")
            self.ans_test_features_mms = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_mms.csv")).set_index("index")
        
        self.target_col = "target"
        self.preprocessDataset = PreprocessDataset(
                       one_hot_encode_cols = ["color","version"],
                       min_max_scale_cols = ["cost"],
                       n_components = 2,
                       feature_engineering_functions = {"double_height":double_height})
    def test_train_features_mms(self):
        train_features_mms = self.preprocessDataset.min_max_scaled_columns_train(train_features = self.ans_train_features)
        self.assertTrue(compare_submission_to_answer_df(train_features_mms,self.ans_train_features_mms,"Min Max Scaled Train DF"))

    def test_test_features_mms(self):
        _ = self.preprocessDataset.min_max_scaled_columns_train(train_features = self.ans_train_features)
        test_features_mms = self.preprocessDataset.min_max_scaled_columns_test(test_features = self.ans_test_features)
        self.assertTrue(compare_submission_to_answer_df(test_features_mms,self.ans_test_features_mms,"Min Max Scaled Test DF"))

class TestPCA(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            # Inputs
            # PCA Doesnt play nice with strings so we are just dropping color for this example
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_tts.csv")).set_index("index").drop(columns=["color"])
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_tts.csv")).set_index("index").drop(columns=["color"])
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_pca = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_pca.csv")).set_index("index")
            self.ans_test_features_pca = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_pca.csv")).set_index("index")
        else:
            # Inputs
            # PCA Doesnt play nice with strings so we are just dropping color for this example
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_tts.csv")).set_index("index").drop(columns=["color"])
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_tts.csv")).set_index("index").drop(columns=["color"])
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_pca = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_pca.csv")).set_index("index")
            self.ans_test_features_pca = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_pca.csv")).set_index("index")

        self.target_col = "target"
        self.preprocessDataset = PreprocessDataset(
                       one_hot_encode_cols = ["version"],
                       min_max_scale_cols = ["cost"],
                       n_components = 2,
                       feature_engineering_functions = {"double_height":double_height})
        
    def test_train_features_pca(self):
        train_features_pca = self.preprocessDataset.pca_train(train_features = self.ans_train_features)
        self.assertTrue(compare_submission_to_answer_df(train_features_pca.round(4),self.ans_train_features_pca.round(4),"PCA Train DF"))


    def test_test_features_pca(self):
        _ = self.preprocessDataset.pca_train(train_features = self.ans_train_features)
        test_features_pca = self.preprocessDataset.pca_test(test_features = self.ans_test_features)
        self.assertTrue(compare_submission_to_answer_df(test_features_pca.round(4),self.ans_test_features_pca.round(4),"PCA Test DF"))


class TestFeatureEngineering(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            # Inputs
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_fe = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_fe.csv")).set_index("index")
            self.ans_test_features_fe = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_fe.csv")).set_index("index")
        else:
            # Inputs
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_fe = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_fe.csv")).set_index("index")
            self.ans_test_features_fe = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_fe.csv")).set_index("index")
        self.target_col = "target"
        self.preprocessDataset = PreprocessDataset(
                       one_hot_encode_cols = ["color","version"],
                       min_max_scale_cols = ["cost"],
                       n_components = 2,
                       feature_engineering_functions = {"double_height":double_height})
        
    def test_train_features_fe(self):
        train_features_fe = self.preprocessDataset.feature_engineering_train(train_features = self.ans_train_features)
        self.assertTrue(compare_submission_to_answer_df(train_features_fe,self.ans_train_features_fe,"Feature Engineered Train DF"))

    def test_test_features_fe(self):
        test_features_fe = self.preprocessDataset.feature_engineering_test(test_features = self.ans_test_features)
        self.assertTrue(compare_submission_to_answer_df(test_features_fe,self.ans_test_features_fe,"Feature Engineered Test DF"))

class TestPreprocess(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            # Inputs
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_preprocess = pd.read_csv(os.path.join(os.getcwd(),"task2","train_feats_preprocess.csv")).set_index("index")
            self.ans_test_features_preprocess = pd.read_csv(os.path.join(os.getcwd(),"task2","test_feats_preprocess.csv")).set_index("index")
        else:
            # Inputs
            self.ans_train_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_feats_tts.csv")).set_index("index")
            self.ans_test_features = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_feats_tts.csv")).set_index("index")
            self.ans_train_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","train_targets_tts.csv")).set_index("index")["target"]
            self.ans_test_targets = pd.read_csv(os.path.join(os.getcwd(),"..","task2","test_targets_tts.csv")).set_index("index")["target"]
            # Answers
            self.ans_train_features_preprocess = pd.read_csv(os.path.join(os.getcwd(),"..", "task2", "train_feats_preprocess.csv")).set_index("index")
            self.ans_test_features_preprocess = pd.read_csv(os.path.join(os.getcwd(),"..", "task2", "test_feats_preprocess.csv")).set_index("index")

        self.target_col = "target"
        self.preprocessDataset = PreprocessDataset(
                       one_hot_encode_cols = ["color","version"],
                       min_max_scale_cols = ["cost"],
                       n_components = 2,
                       feature_engineering_functions = {"double_height":double_height})
        
    def test_train_features_preprocess(self):
        self.train_features_preprocess = self.preprocessDataset.preprocess_train(train_features = self.ans_train_features)
        self.assertTrue(compare_submission_to_answer_df(self.train_features_preprocess,self.ans_train_features_preprocess,"Preprocessed Train DF"))

    def test_test_features_preprocess(self):
        _ = self.preprocessDataset.preprocess_train(train_features = self.ans_train_features)
        self.test_features_preprocess = self.preprocessDataset.preprocess_test(test_features = self.ans_test_features)
        self.assertTrue(compare_submission_to_answer_df(self.test_features_preprocess,self.ans_test_features_preprocess,"Preprocessed Test DF"))

if __name__ == '__main__':
    unittest.main()