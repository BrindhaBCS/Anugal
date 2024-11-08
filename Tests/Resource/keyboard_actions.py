import pyautogui
import time

def press_keys(keys):
    """
    Simulate pressing multiple keys. Each key should be separated by a space in the input string.
    Example: press_keys("tab enter") will press TAB and then ENTER.
    """
    time.sleep(1)  # Adjust delay if needed
    for key in keys.split():
        pyautogui.press(key)

def handle_open_powershell_popup():
    """
    This function handles the "Open Windows PowerShell" popup by locating
    the "Open Windows PowerShell" button on the screen and clicking it.
    """
    # Wait for the popup to appear (adjust the time if necessary)
    time.sleep(2)
    
    # Locate the "Open Windows PowerShell" button on the screen
    button_location = pyautogui.locateCenterOnScreen('Open Windows PowerShell', confidence=0.8)
    
    if button_location:
        # Click on the button
        pyautogui.click(button_location)
        print("Clicked on 'Open Windows PowerShell'")
    else:
        print("Button not found on screen. Make sure the popup is visible and the image is correct.")

# Run the function if executing the script directly
if __name__ == "__main__":
    handle_open_powershell_popup()
