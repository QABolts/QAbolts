from robot.api.deco import library, keyword
from robot.api import logger
from shared_state import shared_state

@library
class robotListener:
    ROBOT_LISTENER_API_VERSION = 3

    def close(self):
        global_array = shared_state.get_array()
        open('application_urls.txt','a').write('\n'.join(global_array)+'\n')
