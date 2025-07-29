from robot.api.deco import library, keyword
import os

@library
class CsvLibrary:
    ROBOT_LIBRARY_SCOPE = "SUITE"

    def __init__(self, filename):
        filepath = os.path.join(os.path.dirname(os.path.abspath(__file__)), filename)
        self.file = filepath

    @keyword
    def create_file(self):
        if not os.path.exists(self.file):
            with open(self.file, 'w') as f:
                f.write('\n')

    @keyword
    def create_empty_file(self):
        with open(self.file, 'w') as f:
            f.write('\n')

    @keyword
    def add_column(self, column_name):
        with open(self.file, 'r') as f:
            lines = f.readlines()

            if not lines:
                return # no vontent to modify
            
            first_line = lines[0].rstrip('\n') + f"{column_name};\n" + ";"
            
            new_lines = [first_line] + lines[1:]
                                               
            with open(self.file, 'w') as f:
                f.writelines(new_lines)
    @keyword
    def add_line(self, *line_data):
        data = ';'.join(line_data) + ';'
        with open(self.file, 'a') as f:
            f.write(data + '\n')

    @keyword
    def read_data(self):
        data = []
        with open(self.file, 'r') as f:
            lines = f.readlines()
        keys = lines[0].split(';')
        for line in lines[1:]:
            line_as_dict = {}
            for index, key in enumerate(keys):
                if index == 0:
                    line_as_dict["Test case name"] = line.split(';')[index]
                elif key != '\n':
                    line_as_dict[key] = line.split(';')[index]
            data.append(line_as_dict)
        return data