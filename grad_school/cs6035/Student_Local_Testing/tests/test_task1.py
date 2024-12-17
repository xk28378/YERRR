import unittest
import json
import sys
import numpy as np
import os
import pandas as pd

if os.path.split(os.getcwd())[-1]=="Student_Local_Testing":
    folder_loc="main"
    sys.path.append(os.getcwd())
    from src.task1 import *
    from tests.utils import *
elif os.path.split(os.getcwd())[-1]=="tests":
    folder_loc="tests"
    sys.path.append(os.path.abspath(os.path.join(os.getcwd(),"..")))
    from src.task1 import *
    from tests.utils import *
else:
    raise Exception(f"Running Tests from `{os.path.split(os.getcwd())[-1]}`. Please run the tests with your CWD set to either Student_Local_Testing or tests folders")

class Test_find_dataset_statistics(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"task1","sample.csv"))
        else:
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"..","task1","sample.csv"))
        self.target_col = "target"
        #Run Function Code
        self.n_records,self.n_columns,self.n_negative,self.n_positive,self.perc_positive = find_dataset_statistics(self.dataset,self.target_col)
    
    def test_nrecords(self):
        self.assertTrue(compare_submission_to_answer(self.n_records,10,"n_records"))

    def test_n_columns(self):
        self.assertTrue(compare_submission_to_answer(self.n_columns,5,"n_columns"))

    def test_n_negative(self):
        self.assertTrue(compare_submission_to_answer(self.n_negative,5,"n_negative"))

    def test_n_positive(self):
        self.assertTrue(compare_submission_to_answer(self.n_positive,5,"n_positive"))
    
    def test_perc_positive(self):
        self.assertTrue(compare_submission_to_answer(self.perc_positive,50,"perc_positive"))

class Test_find_data_type(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"task1","sample.csv"))
        else:
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"..","task1","sample.csv"))

    def test_find_data_type_target(self):
        self.assertEqual(find_data_type(self.dataset, "target"), np.int64)

    def test_find_data_type_color(self):
        self.assertEqual(find_data_type(self.dataset, "color"), object)

    def test_find_data_type_version(self):
        self.assertEqual(find_data_type(self.dataset, "version"), np.int64)

    def test_find_data_type_cost(self):
        self.assertEqual(find_data_type(self.dataset, "cost"), np.float64)

    def test_find_data_type_height(self):
        self.assertEqual(find_data_type(self.dataset, "height"), np.int64)

class Test_set_index_col(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"task1","sample.csv"))
        else:
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"..","task1","sample.csv"))

    def test_set_index_col_target(self):
        self.assertTrue(compare_submission_to_answer(set_index_col(self.dataset, self.dataset["target"]).index.to_list(), self.dataset["target"].to_list(),"set_index_col (target)"))

    def test_set_index_col_color(self):
        self.assertTrue(compare_submission_to_answer(set_index_col(self.dataset, self.dataset["color"]).index.to_list(), self.dataset["color"].to_list(),"set_index_col (color)"))

    def test_set_index_col_version(self):
        self.assertTrue(compare_submission_to_answer(set_index_col(self.dataset, self.dataset["version"]).index.to_list(), self.dataset["version"].to_list(),"set_index_col (version)"))

    def test_set_index_col_cost(self):
        self.assertTrue(compare_submission_to_answer(set_index_col(self.dataset, self.dataset["cost"]).index.to_list(), self.dataset["cost"].to_list(),"set_index_col (cost)"))

    def test_set_index_col_height(self):
        self.assertTrue(compare_submission_to_answer(set_index_col(self.dataset, self.dataset["height"]).index.to_list(), self.dataset["height"].to_list(),"set_index_col (height)"))
    
class Test_reset_index_col(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"task1","reset_index_input.csv"), index_col=0)
            self.answer = pd.read_csv(os.path.join(os.getcwd(),"task1","reset_index_answer.csv"), index_col=0)
        else:
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"..","task1","reset_index_input.csv"), index_col=0)
            self.answer = pd.read_csv(os.path.join(os.getcwd(),"..","task1","reset_index_answer.csv"), index_col=0)

    def test_reset_index_col(self):
        self.assertTrue(compare_submission_to_answer_df(reset_index_col(self.dataset),self.answer,"reset_index_col"))

class Test_set_col_type(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"task1","sample.csv"))
        else:
            self.dataset = pd.read_csv(os.path.join(os.getcwd(),"..","task1","sample.csv"))
        self.target_col = "target"

    def test_set_col_type_target(self):
        self.assertEqual(np.dtype(set_col_type(self.dataset, self.target_col,np.float64)[self.target_col]), np.float64)

class Test_sort_df_by_column(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join("task1","sample.csv"))
            self.sort_df_by_column_example = pd.read_csv(os.path.join("task1","sort_version_desc.csv"), index_col=0)
        else:
            self.dataset = pd.read_csv(os.path.join("..","task1","sample.csv"))
            self.sort_df_by_column_example = pd.read_csv(os.path.join("..","task1","sort_version_desc.csv"), index_col=0)
        self.sort_col = "version"

    def test_sort_df_version(self):
        self.assertTrue(compare_submission_to_answer_df(sort_DF_by_column(self.dataset, self.sort_col, True),self.sort_df_by_column_example,"sort_DF_by_column (version)"))

class Test_drop_na_cols(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset2 = pd.read_csv(os.path.join("task1","sample2.csv"))
            self.drop_na_cols_example = pd.read_csv(os.path.join("task1","drop_na_cols.csv"))
        else:
            self.dataset2 = pd.read_csv(os.path.join("..","task1","sample2.csv"))
            self.drop_na_cols_example = pd.read_csv(os.path.join("..","task1","drop_na_cols.csv"))
        
    def test_drop_na_cols(self):
        self.assertTrue(compare_submission_to_answer_df(drop_NA_cols(self.dataset2),self.drop_na_cols_example,"drop_NA_cols"))

class Test_drop_na_rows(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset2 = pd.read_csv(os.path.join("task1","sample2.csv"))
            self.drop_na_rows_example = pd.read_csv(os.path.join("task1","drop_na_rows.csv"))
        else:
            self.dataset2 = pd.read_csv(os.path.join("..","task1","sample2.csv"))
            self.drop_na_rows_example = pd.read_csv(os.path.join("..","task1","drop_na_rows.csv"))

    def test_drop_na_rows(self):
        self.assertTrue(compare_submission_to_answer_df(drop_NA_rows(self.dataset2),self.drop_na_rows_example,"drop_NA_rows"))

class Test_make_new_column(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join("task1","sample.csv"))
            self.make_new_column_example = pd.read_csv(os.path.join("task1","make_new_column.csv"))
        else:
            self.dataset = pd.read_csv(os.path.join("..","task1","sample.csv"))
            self.make_new_column_example = pd.read_csv(os.path.join("..","task1","make_new_column.csv"))
        self.new_column_name = "New Column"
        self.new_column_values = [12,13,14,15,16,17,18,19,20,21]
        
    def test_make_new_column(self):
        self.assertTrue(compare_submission_to_answer_df(make_new_column(self.dataset, self.new_column_name, self.new_column_values),self.make_new_column_example,"make_new_column"))

class Test_left_merge_DFs_by_column(unittest.TestCase):
    def setUp(self):
        if folder_loc=="main":
            self.dataset = pd.read_csv(os.path.join("task1","sample.csv"))
            self.dataset2 = pd.read_csv(os.path.join("task1","sample2.csv"))
            self.left_merge_dfs_by_column_example = pd.read_csv(os.path.join("task1","left_join_dfs_by_column.csv"))
        else:
            self.dataset = pd.read_csv(os.path.join("..","task1","sample.csv"))
            self.dataset2 = pd.read_csv(os.path.join("..","task1","sample2.csv"))
            self.left_merge_dfs_by_column_example = pd.read_csv(os.path.join("..","task1","left_join_dfs_by_column.csv"))
        self.merge_col = "version"

    def test_left_merge_DFs_by_column(self):
        self.assertTrue(compare_submission_to_answer_df(left_merge_DFs_by_column(self.dataset, self.dataset2, self.merge_col),self.left_merge_dfs_by_column_example,"left_merge_DFs_by_column"))

class Test_make_df_from_2d_array(unittest.TestCase):
    def setUp(self):
        self.array_2d = np.array([[0,1,2],[3,4,5],[6,7,8],[9,10,11],[12,13,14],[15,16,17],[18,19,20],[21,22,23],[24,25,26],[27,28,29]])
        self.column_names = ["A","B","C"]
        self.index = pd.Series([0,5,10,15,20,25,30,35,40,45])
        if folder_loc=="main":
            self.make_df_from_2d_array_example = pd.read_csv(os.path.join("task1","make_df_from_2d_array.csv"), index_col=0)
        else:
            self.make_df_from_2d_array_example = pd.read_csv(os.path.join("..","task1","make_df_from_2d_array.csv"), index_col=0)
    def test_make_df_from_2d_array(self):
        self.assertTrue(compare_submission_to_answer_df(make_DF_from_2d_array(self.array_2d,self.column_names,self.index),self.make_df_from_2d_array_example,"make_DF_from_2d_array"))

class Test_simpleClass(unittest.TestCase):
    def setUp(self):
        self.simpleClass = simpleClass(length=1, width=2, height=3)

    def test_simpleClass_length(self):
        self.assertEqual(self.simpleClass.length, 1)
    
    def test_simpleClass_width(self):
        self.assertEqual(self.simpleClass.width, 2)

    def test_simpleClass_length(self):
        self.assertEqual(self.simpleClass.height, 3)

if __name__ == '__main__':
    unittest.main()
