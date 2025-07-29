from robot.api.deco import library, keyword

@library
class Counter:
    ROBOT_LIBRARY_SCOPE = "SUITE"
    def __init__(self):
        self.value = 0

    @keyword
    def increment_counter(self): 
        # This method should increase the self.value by 1
        self.value += 1
    
    @keyword
    def get_counter_value(self): 
        # This method should return the current counter value
        return int(self.value)

    @keyword
    def reset_counter(self): 
        # This method should set the counter value at 0
        self.value = 0