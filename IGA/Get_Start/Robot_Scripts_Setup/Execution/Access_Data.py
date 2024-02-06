"""
This module dynamically links variables with values in Data folder at runtime.
"""

import os
import sys
import traceback
from robot.api import logger
DIR_PATH = os.path.dirname(os.path.realpath(__file__))
PARENT_PATH = os.path.abspath(os.path.join(DIR_PATH, os.pardir))
if PARENT_PATH not in sys.path:
    sys.path.append(PARENT_PATH)
${import data folders}


class DataAccess(object):
    "Links variable names to values dynamically at runtime."
    def __init__(self):
        self.curdir = os.path.dirname(os.path.realpath(__file__))
        self.parent_dir = os.path.abspath(os.path.join(self.curdir, os.pardir))
        self.setuppath()
        self.test_server = ""

    def setuppath(self):
        """
        If the parentDir is not in sys.path this function adds it to sys.path
        """
        if self.parent_dir not in sys.path:
            sys.path.insert(0, self.parent_dir)

    @staticmethod
    def _log_fetched_value(command, value):
        """
        Logs value for processing later
        :param command: Command used to fetch value
        :param value: The value to be logged in the report
        """
        try:
            logger.info(command + ": " + str(value))
        except:
            logger.info(command + " value could not be logged." +
                        " Possible unicode processing issue")

    def get_data(self, area, field_name, secured=False):
        """
        Fetches data from data files based on area, test server and fieldname

        :param area: Specifies the area under which a variable is defined
        :param field_name: Specifies which field name to be looked up for value
        :param secured: Boolean to check if the value should be logged to the report
        :returns: Value of the field searched under area.test_server location
        """
        field_value = ""
        command = area + "." + self.test_server + "." + field_name
        try:
            field_value = eval(command)
            log_value = field_value
            if secured:
                log_value = "****"
            self._log_fetched_value(command, log_value)
        except BaseException:
            logger.warn("Failed to fetch value for field: " + command)
            logger.warn(traceback.format_exc())
        return field_value

    ${Project specific data access functions}


class Counter(object):
    "Maintains a counter for screenshot or any other counter throughout the tests."
    def __init__(self):
        self.count = 2

    def get_value(self):
        "Returns current count value"
        return self.count

    def increment_value(self):
        "Increments current count value"
        self.count += 1

    def reset_count(self):
        "Resets current count value to 2"
        self.count = 2


COUNT = Counter()
d = DataAccess()
var = d.get_data
${Variable access calls}

if __name__ == "__main__":
    d.test_server = "Dev"
    print(var('test_value', "Web"))
