import pygame

OUTPUT_FILENAME = "healthbar.PNG"
INPUT_FILENAME = "heart.PNG"

REPEATS = 5
SPACING = 16

input_file = pygame.image.load(INPUT_FILENAME)

output_surface = pygame.Surface(((input_file.get_width() + SPACING) * REPEATS + SPACING, input_file.get_height()), flags=pygame.SRCALPHA)
#output_surface.fill

counter = SPACING
for x in range(0, REPEATS):
    output_surface.blit(input_file, [counter, 0])
    counter += input_file.get_width() + SPACING

pygame.image.save(output_surface, OUTPUT_FILENAME)
