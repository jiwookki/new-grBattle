
import pygame
import random

# auto gen tiling star background 

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

STARS = {
    CircularStar(2, [255, 255, 255]) : 14,
    CircularStar(3, [200, 200, 255]) : 10, 
    CircularStar(5, [255, 100, 100]) : 1, 
    CircularStar(7, [180, 180, 255]) : 2, 
}

SIZE = [4192, 4192]

FILENAME = "output_2.BMP"

STARCOUNT = 900





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
    output_surface.set_colorkey([0, 0, 0])


    chosen_star = None

    for x in range(0, STARCOUNT):
        print("\nselecting star")
        chosen_star = select_star()
        chosen_star.render(output_surface, [random.randint(0, SIZE[0]), random.randint(0, SIZE[1])])
    
    print("writing surface")

    pygame.image.save(output_surface, FILENAME)


        
if __name__ == "__main__":
    main()



