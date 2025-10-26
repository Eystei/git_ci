import os
import allure

from dotenv import load_dotenv

load_dotenv()

class TestExample:

    def test_001(self):
        print(os.getenv("STAGE"))
        assert 1 == 1

    def test_002(self):
        print(os.getenv("STAGE"))
        assert 1 != 2