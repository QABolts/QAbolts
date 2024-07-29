# from selenium.webdriver.support.events import AbstractEventListener, EventFiringWebDriver
# from SeleniumLibrary import SeleniumLibrary
from SeleniumLibrary.base import keyword



from SeleniumLibrary import SeleniumLibrary
from selenium.webdriver.support.events import EventFiringWebDriver, AbstractEventListener
from robot.libraries.BuiltIn import BuiltIn

class UrlListener(AbstractEventListener):
    def __init__(self):
        self.current_url = None

    def after_navigate_to(self, url, driver):
        self.current_url = url
        BuiltIn().log(f"Navigated to {url}")

class CustomSeleniumLibrary(SeleniumLibrary):
    def __init__(self, *args, **kwargs):
        super(CustomSeleniumLibrary, self).__init__(*args, **kwargs)
        self.listener = UrlListener()

    def _create_event_firing_driver(self):
        BuiltIn().log("event created")
        self._event_driver = EventFiringWebDriver(self.driver, self.listener)
        self.driver = self._event_driver
    
    def open_browser(self, *args, **kwargs):
        BuiltIn().log("open browser")
        super(CustomSeleniumLibrary, self).open_browser(*args, **kwargs)
        self._create_event_firing_driver()

    def get_current_url(self):
        BuiltIn().log(self.listener.current_url)
        return self.listener.current_url