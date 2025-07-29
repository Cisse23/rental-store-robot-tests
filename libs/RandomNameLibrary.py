from robot.api.deco import keyword, library
import random

@library
class RandomNameLibrary:
    def __init__(self):
        pass
    # lukee filestä: path = os.path.join(os.path.dirname(os.path.abspath(__file__)), filename)

    @keyword
    def get_random_firstname(self):
        firstnames = ['Antonín', 'Björk', 'Camélia', 'Chloë', 'Dvořák', 'Fátima', 'François', 'Göran', 'Hrithik', 'İlber', 'José', 'Łukasz', 'Malala', 'Māris', 'Mikhail', 'Naomi', 'Renée', 'Salma', 'Saoirse', 'Sigurður']
        firstname = random.choice(firstnames)
        return firstname
    
    @keyword
    def get_random_lastname(self):
        lastnames = ['Bernardes', 'Fabiański', 'Guðmundsdóttir', 'Gorbachev', 'Guðni', 'Hayek', 'Hollande', 'Jóhannesson', 'Jordana', 'Kravitz', 'Mourinho', 'Ortaylı', 'Osaka', 'Persson', 'Ronán', 'Roshan', 'Sevigny', 'Th.', 'Verpakovskis', 'Zellweger']
        lastname = random.choice(lastnames)
        return lastname
    
    @keyword
    def get_random_number(self, length: int):
        random_number =   random.randint(1, 999)
        return random_number
    
    @keyword
    def get_username(self, firstname: str, first: int, lastname:str, last:int):
        return firstname[:first].lower() + lastname[:last].lower()