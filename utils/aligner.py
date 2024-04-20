import pygame

OUTPUT_FILENAME = "bulletbar.PNG"
INPUT_FILENAME = "bullet.PNG"

REPEATS = 10
SPACING = 4

input_file = pygame.image.load(INPUT_FILENAME)

output_surface = pygame.Surface(((input_file.get_width() + SPACING) * REPEATS + SPACING, input_file.get_height()), flags=pygame.SRCALPHA)
# output_surface.fill([230, 20, 20])

counter = SPACING
for x in range(0, REPEATS):
    output_surface.blit(input_file, [counter, 0])
    counter += input_file.get_width() + SPACING

pygame.image.save(output_surface, OUTPUT_FILENAME)
