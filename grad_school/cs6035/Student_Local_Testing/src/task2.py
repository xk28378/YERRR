import numpy as np
import pandas as pd
import sklearn.preprocessing
import sklearn.decomposition
import sklearn.model_selection

def tts(  dataset: pd.DataFrame,
                       label_col: str, 
                       test_size: float,
                       stratify: bool,
                       random_state: int) -> tuple[pd.DataFrame,pd.DataFrame,pd.Series,pd.Series]:
    # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
    train_features, test_features = sklearn.model_selection.train_test_split(dataset, test_size=test_size, stratify=dataset[label_col] if stratify else None, random_state=random_state)
    train_labels = train_features[label_col]
    test_labels = test_features[label_col]
    train_features = train_features.drop(label_col, axis=1)
    test_features = test_features.drop(label_col, axis=1)
    return train_features,test_features,train_labels,test_labels

class PreprocessDataset:
    def __init__(self, 
                 one_hot_encode_cols:list[str],
                 min_max_scale_cols:list[str],
                 n_components:int,
                 feature_engineering_functions:dict
                 ):
        # TODO: Add any state variables you may need to make your functions work
        self.one_hot_encode_cols = one_hot_encode_cols
        self.min_max_scale_cols = min_max_scale_cols
        self.n_components = n_components
        self.feature_engineering_functions = feature_engineering_functions
        self.one_hot_encoder = sklearn.preprocessing.OneHotEncoder(handle_unknown='ignore')
        self.min_max_scaler = sklearn.preprocessing.MinMaxScaler()
        self.pca = sklearn.decomposition.PCA(n_components=self.n_components, random_state=0)
        return

    def one_hot_encode_columns_train(self,train_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        one_hot_encoded_dataset = pd.DataFrame(self.one_hot_encoder.fit_transform(train_features[self.one_hot_encode_cols]).toarray(), index=train_features.index)
        one_hot_encoded_dataset.columns = self.one_hot_encoder.get_feature_names_out(self.one_hot_encode_cols)
        return one_hot_encoded_dataset.join(train_features.drop(self.one_hot_encode_cols, axis=1))

    def one_hot_encode_columns_test(self,test_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        one_hot_encoded_dataset = pd.DataFrame(self.one_hot_encoder.transform(test_features[self.one_hot_encode_cols]).toarray(), index=test_features.index)
        one_hot_encoded_dataset.columns = self.one_hot_encoder.get_feature_names_out(self.one_hot_encode_cols)
        return one_hot_encoded_dataset.join(test_features.drop(self.one_hot_encode_cols, axis=1))

    def min_max_scaled_columns_train(self,train_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        min_max_scaled_dataset = pd.DataFrame(self.min_max_scaler.fit_transform(train_features[self.min_max_scale_cols]), columns=self.min_max_scale_cols, index=train_features.index)
        return min_max_scaled_dataset.join(train_features.drop(self.min_max_scale_cols, axis=1))

    def min_max_scaled_columns_test(self,test_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        min_max_scaled_dataset = pd.DataFrame(self.min_max_scaler.transform(test_features[self.min_max_scale_cols]), columns=self.min_max_scale_cols, index=test_features.index)
        return min_max_scaled_dataset.join(test_features.drop(self.min_max_scale_cols, axis=1))
    
    def pca_train(self,train_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        pca_dataset =  train_features.dropna(axis='columns')
        pca_dataset = pd.DataFrame(self.pca.fit_transform(pca_dataset), index=pca_dataset.index)
        pca_dataset.columns = [f"component_{i}" for i in range(1, self.n_components+1)]
        return pca_dataset

    def pca_test(self,test_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        pca_dataset =  test_features.dropna(axis='columns')
        pca_dataset = pd.DataFrame(self.pca.transform(pca_dataset), index=pca_dataset.index)
        pca_dataset.columns = [f"component_{i}" for i in range(1, self.n_components+1)]
        return pca_dataset

    def feature_engineering_train(self,train_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        for col_name in self.feature_engineering_functions:
            train_features[col_name] = self.feature_engineering_functions[col_name](train_features)
        return train_features
    
    def feature_engineering_test(self,test_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        for col_name in self.feature_engineering_functions:
            test_features[col_name] = self.feature_engineering_functions[col_name](test_features)
        return test_features

    def preprocess_train(self,train_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        preprocessed_dataset = self.one_hot_encode_columns_train(train_features)
        preprocessed_dataset = self.min_max_scaled_columns_train(preprocessed_dataset)
        preprocessed_dataset = self.feature_engineering_train(preprocessed_dataset)
        return preprocessed_dataset
    
    def preprocess_test(self,test_features:pd.DataFrame) -> pd.DataFrame:
        # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task2.html and implement the function as described
        preprocessed_dataset = self.one_hot_encode_columns_test(test_features)
        preprocessed_dataset = self.min_max_scaled_columns_test(preprocessed_dataset)
        preprocessed_dataset = self.feature_engineering_test(preprocessed_dataset)
        return preprocessed_dataset