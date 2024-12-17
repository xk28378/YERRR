import numpy as np
import pandas as pd
from sklearn.metrics import *
from sklearn.linear_model import *
from sklearn.ensemble import *
from sklearn.feature_selection import RFE

class ModelMetrics:
    def __init__(self, model_type:str,train_metrics:dict,test_metrics:dict,feature_importance_df:pd.DataFrame):
        self.model_type = model_type
        self.train_metrics = train_metrics
        self.test_metrics = test_metrics
        self.feat_imp_df = feature_importance_df
        self.feat_name_col = "Feature"
        self.imp_col = "Importance"
    
    def add_train_metric(self,metric_name:str,metric_val:float):
        self.train_metrics[metric_name] = metric_val

    def add_test_metric(self,metric_name:str,metric_val:float):
        self.test_metrics[metric_name] = metric_val

    def __str__(self): 
        output_str = f"MODEL TYPE: {self.model_type}\n"
        output_str += f"TRAINING METRICS:\n"
        for key in sorted(self.train_metrics.keys()):
            output_str += f"  - {key} : {self.train_metrics[key]:.4f}\n"
        output_str += f"TESTING METRICS:\n"
        for key in sorted(self.test_metrics.keys()):
            output_str += f"  - {key} : {self.test_metrics[key]:.4f}\n"
        if self.feat_imp_df is not None:
            output_str += f"FEATURE IMPORTANCES:\n"
            for i in self.feat_imp_df.index:
                output_str += f"  - {self.feat_imp_df[self.feat_name_col].iloc[i]} : {self.feat_imp_df[self.imp_col].iloc[i]:.4f}\n"
        return output_str


def calculate_naive_metrics(train_features:pd.DataFrame, test_features:pd.DataFrame, train_targets:pd.Series, test_targets:pd.Series, naive_assumption:int) -> ModelMetrics:
    # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task4.html and implement the function as described
    train_metrics = {
        "accuracy" : round(accuracy_score(train_targets, [naive_assumption for i in range(len(train_targets))]), 4),
        "recall" : round(recall_score(train_targets, [naive_assumption for i in range(len(train_targets))]),4),
        "precision" : round(precision_score(train_targets, [naive_assumption for i in range(len(train_targets))]),4),
        "fscore" : round(f1_score(train_targets, [naive_assumption for i in range(len(train_targets))]),4)
        }
    test_metrics = {
        "accuracy" : round(accuracy_score(test_targets, [naive_assumption for i in range(len(test_targets))]),4),
        "recall" : round(recall_score(test_targets, [naive_assumption for i in range(len(test_targets))]),4),
        "precision" : round(precision_score(test_targets, [naive_assumption for i in range(len(test_targets))]),4),
        "fscore" : round(f1_score(test_targets, [naive_assumption for i in range(len(test_targets))]),4)
        }
    naive_metrics = ModelMetrics("Naive",train_metrics,test_metrics,None)
    return naive_metrics

def fnr(y_true:pd.Series,y_pred:pd.Series) -> float:
    dic = {
        'fn': 0,
        'tn': 0,
        'fp': 0,
        'tp': 0
    }
    for i in range(len(y_true)):
        if y_true.iloc[i] == 1 and y_pred.iloc[i] == 0:
            dic['fn'] += 1
        elif y_true.iloc[i] == 0 and y_pred.iloc[i] == 1:
            dic['fp'] += 1
        elif y_true.iloc[i] == 0 and y_pred.iloc[i] == 0:
            dic['tn'] += 1
        elif y_true.iloc[i] == 1 and y_pred.iloc[i] == 1:
            dic['tp'] += 1
    return dic['fn'] / (dic['fn'] + dic['tp'])

def fpr(y_true:pd.Series,y_pred:pd.Series) -> float:
    dic = {
        'fn': 0,
        'tn': 0,
        'fp': 0,
        'tp': 0
    }
    for i in range(len(y_true)):
        if y_true.iloc[i] == 1 and y_pred.iloc[i] == 0:
            dic['fn'] += 1
        elif y_true.iloc[i] == 0 and y_pred.iloc[i] == 1:
            dic['fp'] += 1
        elif y_true.iloc[i] == 0 and y_pred.iloc[i] == 0:
            dic['tn'] += 1
        elif y_true.iloc[i] == 1 and y_pred.iloc[i] == 1:
            dic['tp'] += 1
    return dic['fp'] / (dic['fp'] + dic['tn'])

def calculate_logistic_regression_metrics(train_features:pd.DataFrame, test_features:pd.DataFrame, train_targets:pd.Series, test_targets:pd.Series, logreg_kwargs) -> tuple[ModelMetrics,LogisticRegression]:
    # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task4.html and implement the function as described
    model = LogisticRegression(**logreg_kwargs).fit(train_features,train_targets)
    train_preds = pd.Series(model.predict(train_features))
    test_preds = pd.Series(model.predict(test_features))
    train_metrics = {
        "accuracy" : round(accuracy_score(train_targets, train_preds), 4),
        "recall" : round(recall_score(train_targets, train_preds),4),
        "precision" : round(precision_score(train_targets, train_preds),4),
        "fscore" : round(f1_score(train_targets, train_preds),4),
        "fpr" : round(fpr(train_targets, train_preds),4),
        "fnr" : round(fnr(train_targets, train_preds),4),
        "roc_auc" : round(roc_auc_score(train_targets, train_preds),4)
        }
    test_metrics = {
        "accuracy" : round(accuracy_score(test_targets, test_preds),4),
        "recall" : round(recall_score(test_targets, test_preds),4),
        "precision" : round(precision_score(test_targets, test_preds),4),
        "fscore" : round(f1_score(test_targets, test_preds),4),
        "fpr" : round(fpr(test_targets, test_preds),4),
        "fnr" : round(fnr(test_targets, test_preds),4),
        "roc_auc" : round(roc_auc_score(test_targets, test_preds),4)
        }

    rfe_importance = RFE(model, n_features_to_select=10).fit(train_features, train_targets)
    log_reg_importance = pd.DataFrame({'Feature': rfe_importance.get_feature_names_out(), 'Importance': rfe_importance.ranking_[:10]}).sort_values('Importance', ascending=False)
    log_reg_metrics = ModelMetrics("Logistic Regression",train_metrics,test_metrics,log_reg_importance)

    return log_reg_metrics,model

def calculate_random_forest_metrics(train_features:pd.DataFrame, test_features:pd.DataFrame, train_targets:pd.Series, test_targets:pd.Series, rf_kwargs) -> tuple[ModelMetrics,RandomForestClassifier]:
    # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task4.html and implement the function as described
    model = RandomForestClassifier(**rf_kwargs).fit(train_features,train_targets)
    train_preds = pd.Series(model.predict(train_features))
    test_preds = pd.Series(model.predict(test_features))
    train_metrics = {
        "accuracy" : round(accuracy_score(train_targets, train_preds), 4),
        "recall" : round(recall_score(train_targets, train_preds),4),
        "precision" : round(precision_score(train_targets, train_preds),4),
        "fscore" : round(f1_score(train_targets, train_preds),4),
        "fpr" : round(fpr(train_targets, train_preds),4),
        "fnr" : round(fnr(train_targets, train_preds),4),
        "roc_auc" : round(roc_auc_score(train_targets, train_preds),4)
        }
    test_metrics = {
        "accuracy" : round(accuracy_score(test_targets, test_preds),4),
        "recall" : round(recall_score(test_targets, test_preds),4),
        "precision" : round(precision_score(test_targets, test_preds),4),
        "fscore" : round(f1_score(test_targets, test_preds),4),
        "fpr" : round(fpr(test_targets, test_preds),4),
        "fnr" : round(fnr(test_targets, test_preds),4),
        "roc_auc" : round(roc_auc_score(test_targets, test_preds),4)
        }

    rf_importance = pd.DataFrame({'Feature': train_features.columns, 'Importance': model.feature_importances_}).sort_values('Importance', ascending=False)
    rf_metrics = ModelMetrics("Random Forest",train_metrics,test_metrics,rf_importance.iloc[:10])

    return rf_metrics,model

def calculate_gradient_boosting_metrics(train_features:pd.DataFrame, test_features:pd.DataFrame, train_targets:pd.Series, test_targets:pd.Series, gb_kwargs) -> tuple[ModelMetrics,GradientBoostingClassifier]:
    # TODO: Read the function description in https://github.gatech.edu/pages/cs6035-tools/cs6035-tools.github.io/Projects/Machine_Learning/Task4.html and implement the function as described
    model = GradientBoostingClassifier(**gb_kwargs).fit(train_features,train_targets)
    train_preds = pd.Series(model.predict(train_features))
    test_preds = pd.Series(model.predict(test_features))
    train_metrics = {
        "accuracy" : round(accuracy_score(train_targets, train_preds), 4),
        "recall" : round(recall_score(train_targets, train_preds),4),
        "precision" : round(precision_score(train_targets, train_preds),4),
        "fscore" : round(f1_score(train_targets, train_preds),4),
        "fpr" : round(fpr(train_targets, train_preds),4),
        "fnr" : round(fnr(train_targets, train_preds),4),
        "roc_auc" : round(roc_auc_score(train_targets, train_preds),4)
        }
    test_metrics = {
        "accuracy" : round(accuracy_score(test_targets, test_preds),4),
        "recall" : round(recall_score(test_targets, test_preds),4),
        "precision" : round(precision_score(test_targets, test_preds),4),
        "fscore" : round(f1_score(test_targets, test_preds),4),
        "fpr" : round(fpr(test_targets, test_preds),4),
        "fnr" : round(fnr(test_targets, test_preds),4),
        "roc_auc" : round(roc_auc_score(test_targets, test_preds),4)
        }

    gb_importance = pd.DataFrame({'Feature': train_features.columns, 'Importance': model.feature_importances_}).sort_values('Importance', ascending=False)
    gb_metrics = ModelMetrics("Gradient Boosting",train_metrics,test_metrics,gb_importance.iloc[:10])

    return gb_metrics,model