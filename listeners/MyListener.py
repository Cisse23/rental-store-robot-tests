from robot import result, running
from robot.api.interfaces import ListenerV3

class Example(ListenerV3):
    def log_message(self, data:running.TestSuite, result: running.TestSuite, message):
        print(f"The test is trying to print something!")
        return super().log_message(message)