import unittest
import os 


class test_python_version(unittest.TestCase):
    def setUp(self):
        from platform import python_version
        self.python_version = python_version()
    def test_python(self):
        self.assertEqual("3.10.6",self.python_version)

class test_sklearn_package_version(unittest.TestCase):
    def setUp(self):
        import sklearn
        self.sklearn_version = sklearn.__version__
    def test_sklearn(self):
        self.assertEqual("1.4.0",self.sklearn_version)

class test_scipy_package_version(unittest.TestCase):
    def setUp(self):
        import scipy
        self.scipy_version = scipy.__version__
    def test_scipy(self):
        self.assertEqual("1.12.0",self.scipy_version)

class test_pandas_package_version(unittest.TestCase):
    def setUp(self):
        import pandas as pd
        self.pandas_version = pd.__version__
    def test_pandas(self):
        self.assertEqual("2.2.0",self.pandas_version)

class test_yellowbrick_package_version(unittest.TestCase):
    def setUp(self):
        import yellowbrick
        self.yellowbrick_version = yellowbrick.__version__
    def test_yellowbrick(self):
        self.assertEqual("1.5",self.yellowbrick_version)