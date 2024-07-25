from SeleniumLibrary import SeleniumLibrary
from SeleniumLibrary.base import keyword
from selenium.webdriver.common.by import By

class QAboltsLibrary(SeleniumLibrary):
    @keyword
    def input_text(self, text: str, clear: bool = True, label=None, placeholder=None, timeout=10, locator= None, error_message="Element not found"):
        """
        Waits until the element specified by the locator is visible, then inputs the given text.

        :param locator: Locator of the element where text needs to be input.
        :param text: Text to be input.
        :param clear: Whether to clear the existing text in the element. Defaults to True.
        :param label: Optional parameter for locating the element by label.
        :param placeholder: Optional parameter for locating the element by placeholder.
        :param timeout: Maximum time to wait for the element to be visible. Defaults to 10 seconds.
        :param error_message: Custom error message if the element is not found within the timeout.
        """
        # Use the provided label or placeholder if given
        if label:
            locator = f'//label[text()="{label}"]/../..//input'
        elif placeholder:
            locator = f'//input[@placeholder="{placeholder}"]'
        print (locator)
        # Wait until the element is visible
        self.wait_until_element_is_visible(locator, timeout=timeout, error=error_message+locator)
        
        
        self.input_text(locator, text, clear)