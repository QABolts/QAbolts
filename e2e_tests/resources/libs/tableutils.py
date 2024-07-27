from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
import time
        
def verify_table_values(column_name, column_value):
    driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
    headers = {}
    time.sleep(5)
    for i,header in enumerate(driver.find_elements(By.CSS_SELECTOR, '.oxd-table-th')):
        headers[header.text] = i

    
    for row in driver.find_elements(By.CSS_SELECTOR, f'.oxd-table-row--clickable [role="cell"]:nth-of-type({headers[column_name]+1})'):
        print (row.text)
        if row.text == column_value:
            return True
    
    raise AssertionError
