# Converts image.h.extension to image.h

from PIL import Image
import argparse

parser = argparse.ArgumentParser(description="Convert images to .h")
parser.add_argument("-i", "--image", required=True, help="Image to convert")
parser.add_argument("-o", "--output", required=True, help="Output file")
parser.add_argument("-W", "--width", type=int, default=640, help="Width of the image")
parser.add_argument("-H", "--height", type=int, default=480, help="Height of the image")
parser.add_argument("name")

args = parser.parse_args()

im = Image.open(args.image)
out = open(args.output, "w")

out.write("""

/*
 * BMP image data converted from 24bpp
 * to RGB888
 */

#include "defines.h"
uint32 """ + args.name + "_w = " + str(args.width) + """;
uint32 """ + args.name + "_h = " + str(args.height) + """;

uint32 __attribute__((aligned(16))) """ + args.name +"[] = {")

pixels = list(im.getdata())

for (i, pixel) in enumerate(pixels):
    out.write(f"0x{pixel[2]:02X}{pixel[1]:02X}{pixel[0]:02X}")
    if i != len(pixels) - 1:
        out.write(",")

out.write("};\n")
out.close()