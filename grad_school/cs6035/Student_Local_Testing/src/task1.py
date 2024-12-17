import numpy as np
import pandas as pd


def find_data_type(dataset:pd.DataFrame,column_name:str) -> np.dtype:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return dataset.dtypes[column_name]

# Set/unset column as index 
def set_index_col(dataset:pd.DataFrame,index:pd.Series) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return dataset.set_index(pd.Index(index))

def reset_index_col(dataset:pd.DataFrame) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return dataset.reset_index(drop=True)

# Set astype (string, int, datetime)
def set_col_type(dataset:pd.DataFrame,column_name:str,new_col_type:type) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return dataset.astype({column_name: new_col_type})

# Take Matrix of numbers and make it into a dataframe with column name and index numbering
def make_DF_from_2d_array(array_2d:np.array,column_name_list:list[str],index:pd.Series) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return pd.DataFrame(array_2d, columns=column_name_list, index=index)

# Sort Dataframe by values
def sort_DF_by_column(dataset:pd.DataFrame,column_name:str,descending:bool) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return dataset.sort_values(by=column_name, ascending=not descending)

# Drop NA values in dataframe Columns 
def drop_NA_cols(dataset:pd.DataFrame) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return dataset.dropna(axis='columns')

def drop_NA_rows(dataset:pd.DataFrame) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return dataset.dropna()

def make_new_column(dataset:pd.DataFrame,new_column_name:str,new_column_value:list) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    dataset[new_column_name] = new_column_value
    return dataset

def left_merge_DFs_by_column(left_dataset:pd.DataFrame,right_dataset:pd.DataFrame,join_col_name:str) -> pd.DataFrame:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    return left_dataset.merge(right_dataset, how='left', on=join_col_name)

class simpleClass():
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described
    def __init__(self, length:int, width:int, height:int):
        self.length = length
        self.width = width
        self.height = height

def find_dataset_statistics(dataset:pd.DataFrame,label_col:str) -> tuple[int,int,int,int,int]:
    # TODO: Read https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task1.html and implement the function as described

    n_records = dataset.shape[0] # TODO
    n_columns = dataset.shape[1] # TODO
    n_negative = int(dataset.shape[0] - dataset[label_col].sum()) # TODO
    n_positive = int(dataset[label_col].sum()) # TODO
    perc_positive = int(dataset[label_col].mean() * 100) # TODO

    return n_records,n_columns,n_negative,n_positive,perc_positive