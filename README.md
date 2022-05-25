# Introduction 

This is a OpenSCAD based utility to generate a Folgertech FT5 to coreXY using the EVA 
carriage system used on the Ratrig printers, this is a work in progress. 

I'm using OpenSCAD for the design so it is fully parametric fully bed movement
can be simulated and pulley and belt sizes can be changed so belt paths can 
be simulated. This means that you can modify the openscad file based upon 
your available pulleys and belt and the correct design will be generated
for you. 

I've downloaded the STLs from the EVA project into this repo for ease of
use, see here: https://main.eva-3d.page

Nema17 model is from here: https://www.thingiverse.com/thing:67561
Endstop model is from here: https://www.thingiverse.com/thing:2405504/files


This is a work in progress and no STLs for printing have been created yet. 

## Goals

 * Gain the benefits of CoreXY, primarly improved print speed and print quality
 * Reuse as many peices as I can from my existing FT5
 * Share with the community so that others can extend the lives of their FT5s

## Top View
 * [Parallel A-H belt paths](https://drmrehorst.blogspot.com/2018/08/corexy-mechanism-layout-and-belt.html)

![Top](https://raw.githubusercontent.com/celer/FT5_CoreXY_EVA/main/images/top.png)

## Side views

![Front](https://raw.githubusercontent.com/celer/FT5_CoreXY_EVA/main/images/front.png)
![Side](https://raw.githubusercontent.com/celer/FT5_CoreXY_EVA/main/images/side.png)
![Back](https://raw.githubusercontent.com/celer/FT5_CoreXY_EVA/main/images/back.png)

## Model view
![Model](https://raw.githubusercontent.com/celer/FT5_CoreXY_EVA/main/stls/ft5.stl)

# Building

To build the stls you will need a linux environment with openscad installed, simply type 
'make' in the root of the directory and all the models will be generated. Or alternatively 
you can jump to the bottom of the .scad file and select specific models for printing. 

# Assembly

## Parts needed

See the bom.txt in this repo for a build of materials.

### Belts and Pulleys
The currently generated stls assume that you're using a Gates 6mm belt and pulleys, such 
a kit can be acquired from here: https://www.filastruder.com/products/gates-motion-set-for-railcore?_pos=5&_sid=bafef878a&_ss=r

I choose this belt kit because chinese / lesser quality belts stretch and may give poor results. 

This particular kit includes 2 smooth idler pulleys, 6 toothed idler pulleys, and 2 16 tooth motor pulleys. 

### Nuts and bolts

 * 20 M5x10MM bolts and t-slot nuts, which should be scavangable from your existing FT5 build
 * 2 M5x75MM bolts for the EVA carriage
 * An assortment of M3 
 * Shoulder bolts and shims for the pulleys - https://www.amazon.com/gp/product/B077GXK4P5/ref=ppx_yo_dt_b_asin_title_o08_s00?ie=UTF8&psc=1  https://www.filastruder.com/products/shims-for-shoulder-screws?_pos=1&_sid=fd8270e49&_ss=r

 ## What to print

  - You will need to print all the models in "stls/" folder, print these models with atleast 3 layer thickness, top bottom and side, and 40% infill.
  - You will need to choose and print an EVA extruder carriage, make sure to print the rear carriage tensors which allow for the teeth of the belts to face the rear of the printer
  - For the x axis you can either use your exisiting aluminum extrusion or go down the path of the carbon fiber square tube. I've included parts for the extrusion which are marked have the suffix *_al_2020.stl or *_cf_tube.stl which are for the carbon fiber square tube. See the section below on the carbon fiber square tube

## Assembly 

### Carbon Fiber Square Tube (optional)

Print out 2 copies of the xy_carriage_mount_cf_tube_upper_drill_jig.stl and use these two parts to align the holes to drill on the carbon fiber tube, the drill jig is setup so that it aligns the holes for the linear rail and then mounting brackets. I have not tested this drill jig, so you should use it with caution. You essentially drill the holes to mount the linear rail and end mounts, drilling through both sides of the square tube, find them smallest 1/4" socket which fits the M3 nuts required to attach the linear rail to the square tube and enlarge the holes on the bottom of the square tube so that you can fight the socket into the holds to tighten the linear rail to the carbon fiber rod. 
 
### Assemble the X rail 

1. Remove the old FT5 components 
2. You will need to insure that the XY carriage uppers and lowers have the 'F' near the front of the printer, the carriages are not symmetric front to back. 

### Assemble the Y rail

1. Remove the old FT5 components
2. Remove the top aluminum extrusion rail and assemble the motor mounts and rear pulley mounts with appropriate M5 and tslot nuts then with the top rectangle of the aluminum extrusion removed from the printer slide the motor and rear pulley mounts down into place. 

### Attach the belts

1. When attaching the belts you'll need to insure that the belts are level and parrallel to the main axis of the printer. 
2. Add the Y endstop

# Included Marlin settings

I have included my marlin Configuration.h and Configuration_adv.h


