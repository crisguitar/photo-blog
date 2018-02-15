from __future__ import print_function
from PIL import Image, ImageOps
import glob
import os

THUMBNAIL_SIZE = (500, 500)
OUTPUT_MESSAGE = 'Generated {0} thumbnails.'
THUMBNAILS_DIR = 'thumbnails'

def thumbnail(filename):
    original = Image.open(filename)
    thumb = ImageOps.fit(original, THUMBNAIL_SIZE, Image.ANTIALIAS)
    output_filename = filename.replace('photos', 'thumbnails')
    thumb.save(output_filename)
    return output_filename

if not os.path.exists(THUMBNAILS_DIR):
    os.makedirs(THUMBNAILS_DIR)

photos = glob.glob('photos/*.jpg')

thumbnails = [thumbnail(photo) for photo in photos]

print(OUTPUT_MESSAGE.format(len(thumbnails)))

[print(thumb) for thumb in thumbnails]
