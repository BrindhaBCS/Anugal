# from dbm import _error
import win32com.client
import time
from robot.api import logger
import pyautogui
import time
from pythoncom import com_error



class Anugal_library:
    def __init__(self):
        self.explicit_wait = float(0.0)
        self.session = None

    def initialize_sap_connection(self):
        """
        Initializes the SAP GUI session for scripting.
        """
        sapGuiAuto = win32com.client.GetObject("SAPGUI")
        if not sapGuiAuto:
            raise RuntimeError("Cannot find SAP GUI. Please ensure it is running.")
        
        application = sapGuiAuto.GetScriptingEngine
        if application is None:
            raise RuntimeError("Failed to access the SAP scripting engine.")
        
        connection = application.Children(0)
        if connection is None:
            raise RuntimeError("Failed to establish a connection. Ensure SAP Logon has an active session.")
        
        self.session = connection.Children(0)
        if self.session is None:
            raise RuntimeError("No active SAP session found.")

    def run_transaction(self, transaction_code):
        """
        Runs the specified SAP transaction code.
        
        Parameters:
            transaction_code (str): The SAP transaction code to execute.
        """
        if not self.session:
            self.initialize_sap_connection()
        
        self.session.findById("wnd[0]/tbar[0]/okcd").text = transaction_code
        self.session.findById("wnd[0]").sendVKey(0)
        print(f"Transaction '{transaction_code}' executed successfully.")

    def input_text(self, element_id, text):
        """Inserts the given text into the text field identified by locator.
        Use keyword `input password` to insert a password in a text field.
        """
        element_type = self.get_element_type(element_id)
        if (element_type == "GuiTextField"
                or element_type == "GuiCTextField"
                or element_type == "GuiShell"
                or element_type == "GuiPasswordField"):
            self.session.findById(element_id).text = text
            logger.info("Typing text '%s' into text field '%s'." % (text, element_id))
            time.sleep(self.explicit_wait)
        else:
            self.take_screenshot()
            message = "Cannot use keyword 'input text' for element type '%s'" % element_type
            raise ValueError(message)
        
    def click_element(self, element_id):
        """Performs a single click on a given element. Used only for buttons, tabs and menu items.

        In case you want to change a value of an element like checkboxes of selecting an option in dropdown lists,
        use `select checkbox` or `select from list by label` instead.
        """

        # Performing the correct method on an element, depending on the type of element
        element_type = self.get_element_type(element_id)
        if (element_type == "GuiTab"
                or element_type == "GuiMenu"):
            self.session.findById(element_id).select()
        elif element_type == "GuiButton":
            self.session.findById(element_id).press()
        else:
            self.take_screenshot()
            message = "You cannot use 'click_element' on element type '%s', maybe use 'select checkbox' instead?" % element_type
            raise Warning(message)
        time.sleep(self.explicit_wait)
    
    def press_keys(self, keys):
        """
        Simulate pressing multiple keys. Each key should be separated by a space in the input string.
        Example: press_keys("tab enter") will press TAB and then ENTER.
        """
        time.sleep(1)  # Adjust delay if needed
        for key in keys.split():
            pyautogui.press(key)

    def get_element_type(self, element_id):
        """Returns the Sap element type for the given element.
        """
        try:
            type = self.session.findById(element_id).type
            return type
        except com_error:
            self.take_screenshot()
            message = "Cannot find element with id '%s'" % element_id
            raise ValueError(message)
