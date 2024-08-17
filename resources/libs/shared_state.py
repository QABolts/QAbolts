# shared_state.py
from threading import Lock

class SharedState:
    _instance = None
    _lock = Lock()

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            with cls._lock:
                if not cls._instance:
                    cls._instance = super(SharedState, cls).__new__(cls, *args, **kwargs)
                    cls._instance.global_array = []
        return cls._instance

    def get_array(self):
        return self.global_array

    def append_to_array(self, value):
        with self._lock:
            self.global_array.append(value)

shared_state = SharedState()
