
import pygame
import random

# auto gen tiling star background 

pygame.display.init()

class CelestialObject():

    def __init__(self, size : pygame.math.Vector2):
        self.size = size 

    def render(self, render_target : pygame.Surface, position):
        pass

class CircularStar(CelestialObject):

    def __init__(self, radius, color):
        self.size = pygame.math.Vector2(radius * 2, radius * 2)
        self.radius = radius
        self.color = color

    def render(self, render_target : pygame.Surface, position):
        print('rendering')
        pygame.draw.circle(render_target, self.color, position, self.radius)


class ImageStar(CelestialObject):
    
    def __init__(self, filename,  scale_factor = 1):
        self.image = pygame.image.load(filename)
        self.image = self.image.convert_alpha()
        if scale_factor != 1:
            self.image = pygame.transform.smoothscale(self.image, (self.image.get_width() * scale_factor, self.image.get_height() * scale_factor))
        self.size = pygame.math.Vector2(self.image.get_width(), self.image.get_height())
    
    def render(self, render_target : pygame.Surface, position):
        render_target.blit(self.image, position)

class RandomizedImageStar(CelestialObject):
    
    def __init__(self, filename,  scale_factor = 1):
        self.image = pygame.image.load(filename)
        self.image = self.image.convert_alpha()
        if scale_factor != 1:
            self.image = pygame.transform.smoothscale(self.image, (self.image.get_width() * scale_factor, self.image.get_height() * scale_factor))
        
        self.size = pygame.math.Vector2(self.image.get_width(), self.image.get_height())
    
    def render(self, render_target : pygame.Surface, position):
        self.image = pygame.transform.rotate(self.image, random.randint(0, 360))
        render_target.blit(self.image, position)


# !!! CONFIGURABLES !!!



# Dictionary of stars, CelestialObject : relative frequency
# STARS = {
#     CircularStar(5, [255, 255, 255]) : 5,
#     CircularStar(8, [200, 200, 255]) : 9, 
#     CircularStar(12, [255, 100, 100]) : 6, 
#     CircularStar(16, [255, 160, 10]) : 4, 
#     CircularStar(24, [160, 160, 255]) : 2, 
# }

# SIZE = [4192, 4192]

# FILENAME = "output.BMP"

# STARCOUNT = 200

# STARS = {
#     CircularStar(1, [255, 255, 255]) : 500,
#     CircularStar(2, [255, 255, 255]) : 300,
# }

screen = pygame.display.set_mode((640, 480))

STARS = {
    RandomizedImageStar("blackhole.png", 2) : 1,
    RandomizedImageStar("nebula_1.PNG", 2) : 1,
    RandomizedImageStar("nebula_2.png", 4) : 1,
    RandomizedImageStar("redgiant1.png", 3) : 1,
 }

SIZE = [4192, 4192]

FILENAME = "layer_3.BMP"

STARCOUNT = 20






def select_star():

    def go_through_weights(target):

        iteration = 0
        previous = 0
        next_ = 0

        for weight in weights:
            next_ += weight
            if target <= next_ and target >= previous:
                return iteration
            else:
                previous += weight
                iteration += 1
            
        raise Exception(f"weight {str(target)} not found")
    
    weights = STARS.values()
    selected = random.randint(0, sum(weights))

    return list(STARS.keys())[go_through_weights(selected)]




def main():
    output_surface = pygame.Surface(SIZE)
    output_surface.fill([0, 0, 0])
    #output_surface.set_colorkey([0, 0, 0])


    chosen_star = None

    for x in range(0, STARCOUNT):
        print("\nselecting star")
        chosen_star = select_star()
        chosen_star.render(output_surface, [random.randint(chosen_star.size[0], SIZE[0] - chosen_star.size[0]), random.randint(chosen_star.size[1], SIZE[1] - chosen_star.size[1])])
    
    print("writing surface")

    pygame.image.save(output_surface, FILENAME)


        
if __name__ == "__main__":
    main()



