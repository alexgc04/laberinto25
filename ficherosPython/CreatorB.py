from Creator import Creator
from ParedBomba import ParedBomba

class CreatorB(Creator):

    def fabricarPared(self):
        return ParedBomba()