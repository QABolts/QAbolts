# SharedLibrary.py
from robot.api.deco import keyword
from shared_state import shared_state

class SharedLibrary:
    
    @keyword
    def get_global_array(self):
        return shared_state.get_array()

    @keyword
    def append_to_global_array(self, value):
        shared_state.append_to_array(value)
