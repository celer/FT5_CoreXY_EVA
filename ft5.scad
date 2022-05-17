

// Introduction    //////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
// 1. Measure and define your pulleys
//
// To get a CoreXY system working well the belts *MUST* be parallel
// to the axies, which means we need to accurately measure our belts
// and pulleys.
// 

// 1. Pulley definitions ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////
// The pulley definitions define details about the pulleys which are critical to getting
// a precise corexy movement, the front belts MUST be parallel to their respective axis.

// The DWB = Diameter with belt - this the measurement of the diameter of the pulley
// with the belt on it. 

//// Motor pully definitions

///// Motor Pulley Height
MotorPulleyH = 16;   

//// Motor Pulley Diamater With Belt
MotorPulleyDWB = 11.04;

//// X Axis Pulleys
////////////////////////////////////////////////////////////////////
// X Axis Pulley details, I have accounted for the smooth pullyes seperately because
// they will have a different diameter than the toothed pulleys

// X Pulley Smooth Height
XPulleySmoothH = 10;
// X Pulley Smooth Diameter with Belt
XPulleySmoothDWB = 14.82;

// X Axis Pulley details, this can be toothed or smooth
// X Pulley Toothed Height
XPulleyToothedH = 10;
// X Pulley Toothed Diameter with Belt
XPulleyToothedDWB = 13.72;

// Rear left and right corner Pulley details
CornerPH = 10; // Height
CornerPDWN = 13.72; // Outside diameter with belt
CornerPulleyMountSpacer=1;

//////////////////// FT5 Dimensions //////////////////////////////////////////////
//
// I've measured these somewhat accurately but thit's worth double checking.
//
// This is the distance between the centers of the exterior 2020 extrusions, measured 
// at center
ExteriorWidth = 520;
ExteriorDepth = 482;

// The inteior space of the XY carriage area 
// measured center of extrusion to center of extrusion
InteriorWidth = ExteriorWidth-100;

InteriorDepth = ExteriorDepth;

// Center of XY Carriage height
XYCarriageHeight = 532;

// Total Length of the 2020 extrusion for the X axis
X2020Length = ExteriorWidth-20;

// FIXME this has an issue with hitting the Y blocks. 
// How far off the Y MGN12 block the X 2020 extrusion is
XCarriageMountHeight = 7;

// Overall height of the printer
Height = 720;

//This is how thick the belt is so the front pulleys can be placed correctly
BeltThickness = 1.50;

// The height of the belt, in theory changing this to a wider belt should just work
BeltHeight = 5.8;

MotorX = 42.3;
MotorY = 42.3;

// Total height of an MGN12 rail and block 
MGN12Height = 13;

//How much to offset each pulley so that doesn't interfer with the others
RearPulleyOffset = 10;


// Z Axis dimensions
ZAxisLinearRodOffsetsFromFront=[117,317];
ZAxisMotorOffset=215.5;
ZAxisSideOffset=60;

// Enclosure
EnclosureWidth=495;
EnclosureHeight=172;
EnclosureDepth=78+5;

///////////////////////////////////////////// EVA Platform ////////////////////////////////
/// The EVA Carriage platform is meant to allow easy swapping of carriages so this is used
// by the ratrig guys to make it easy to support multiple extruders. 
// see https://main.eva-3d.page/

// Belt Offsets as calculated from the center of X MGN12 block
EVAFrontBeltY = 15.5;

// Center of the belt offset as calculated from the center top of the MGN12 block
EVAFrontUpperBeltZ = -18;
EVAFrontLowerBeltZ = -30;

// Center of the belt offset as calculated from the center top of the MGN12 block
EVAFrontUpperBeltX = 17;
EVAFrontLowerBeltX = -26;

// Belt Offsets as calculated from the X block
EVABackBeltY = -16.5;

EVABackLowerBeltZ = -30;
EVABackUpperBeltZ = -18;

EVABackLowerBeltX = 20;
EVABackUpperBeltX = -27;

Extrusion2020Height = 20;
Extrusion2020Width = 20;

/*
EVABackLowerBelt() color("red") cube([20,1.6,6],center=true);
EVABackUpperBelt() color("blue") cube([20,1.6,6],center=true);

EVAHemeraCarriage();*/

///////////////////////////////////////// BED Details /////////////////////////////////////////

// The bed is 35mm forward of the Y center, AFAIK
BedCenterY = 35;

BedX = ExteriorWidth-220+25;
BedY = 325;

////////////////////////////////////////// XY Carriage center on the bed /////////////////////////
// Change this to simulate movement
X = 150;  //(-150 to 150)
Y = 150;  //(-150 to 150)


// Calculated location
YLocation = InteriorDepth/2 - BedCenterY+X;
XLocation = InteriorWidth/2 + Y;


// Calculated upper and lower belt heights
LowerBeltHeight = XYCarriageHeight + Extrusion2020Height/2 +
                MGN12Height + XCarriageMountHeight + Extrusion2020Height + MGN12Height + EVAFrontLowerBeltZ;

UpperBeltHeight = XYCarriageHeight + Extrusion2020Height/2 + 
                MGN12Height + XCarriageMountHeight + Extrusion2020Height + MGN12Height + EVAFrontUpperBeltZ;

//cube([520,20,20],center=true);
//translate([0,0,XYCarriageHeight-10]) cube([400,20,20],center=true);



module frame(){
     union() color("lightgrey") {
        for(x=[-ExteriorWidth/2,ExteriorWidth/2]){
            for(y=[-ExteriorDepth/2,ExteriorDepth/2]){
                  translate([x,y,Height/2]) cube([20,20,Height],center=true); 
            }
        }
                
   
        // XYCarriage
        translate([0,-ExteriorDepth/2,XYCarriageHeight]) cube([ExteriorWidth-20,20,20],center=true);
        translate([0,ExteriorDepth/2,XYCarriageHeight]) cube([ExteriorWidth-20,20,20],center=true);
        
        translate([-ExteriorWidth/2,0,XYCarriageHeight]) cube([20,ExteriorDepth-20,20],center=true);
        translate([ExteriorWidth/2,0,XYCarriageHeight]) cube([20,ExteriorDepth-20,20],center=true);

        translate([-InteriorWidth/2,0,XYCarriageHeight]) cube([20,ExteriorDepth-20,20],center=true);
        translate([InteriorWidth/2,0,XYCarriageHeight]) cube([20,ExteriorDepth-20,20],center=true);
        
        translate([ExteriorWidth/2+10+2.5,ExteriorDepth/2, XYCarriageHeight]) rotate([0,0,-90]) T2020(); 
        translate([ExteriorWidth/2+10+2.5,-ExteriorDepth/2, XYCarriageHeight]) rotate([0,0,90]) T2020();
        translate([ExteriorWidth/2,ExteriorDepth/2+10+2.5, XYCarriageHeight]) rotate([0,0,180]) T2020(); 
        translate([ExteriorWidth/2,-ExteriorDepth/2-10-2.5, XYCarriageHeight]) rotate([0,0,-180]) T2020();
        translate([-ExteriorWidth/2-10-2.5,ExteriorDepth/2, XYCarriageHeight]) rotate([0,0,-90]) T2020(); 
        translate([-ExteriorWidth/2-10-2.5,-ExteriorDepth/2, XYCarriageHeight]) rotate([0,0,90]) T2020();
        translate([-ExteriorWidth/2,ExteriorDepth/2+10+2.5, XYCarriageHeight]) rotate([0,0,0]) T2020(); 
        translate([-ExteriorWidth/2,-ExteriorDepth/2-10-2.5, XYCarriageHeight]) rotate([0,0,0]) T2020();
        
        
        translate([ExteriorWidth/2+10+2.5,ExteriorDepth/2, Height-30]) rotate([0,0,-90]) C2020(); 
        translate([ExteriorWidth/2+10+2.5,-ExteriorDepth/2, Height-30]) rotate([0,0,90]) C2020();
        translate([ExteriorWidth/2,ExteriorDepth/2+10+2.5, Height-30]) rotate([0,0,180]) C2020(); 
        translate([ExteriorWidth/2,-ExteriorDepth/2-10-2.5, Height-30]) rotate([0,0,-180]) C2020();
        
        translate([-ExteriorWidth/2-10-2.5,ExteriorDepth/2,Height-30]) rotate([0,0,-90]) C2020(); 
        translate([-ExteriorWidth/2-10-2.5,-ExteriorDepth/2, Height-30]) rotate([0,0,90]) C2020();
        translate([-ExteriorWidth/2,ExteriorDepth/2+10+2.5, Height-30]) rotate([0,0,0]) C2020(); 
        translate([-ExteriorWidth/2,-ExteriorDepth/2-10-2.5, Height-30]) rotate([0,0,0]) C2020();
        
        translate([ExteriorWidth/2+10+2.5,ExteriorDepth/2, 30]) rotate([180,0,-90]) C2020(); 
        translate([ExteriorWidth/2+10+2.5,-ExteriorDepth/2, 30]) rotate([180,0,90]) C2020();
        translate([ExteriorWidth/2,ExteriorDepth/2+10+2.5, 30]) rotate([180,0,180]) C2020(); 
        translate([ExteriorWidth/2,-ExteriorDepth/2-10-2.5, 30]) rotate([180,0,-180]) C2020();
        
        translate([-ExteriorWidth/2-10-2.5,ExteriorDepth/2, 30]) rotate([180,0,-90]) C2020(); 
        translate([-ExteriorWidth/2-10-2.5,-ExteriorDepth/2, 30]) rotate([180,0,90]) C2020();
        translate([-ExteriorWidth/2,ExteriorDepth/2+10+2.5, 30]) rotate([180,0,0]) C2020(); 
        translate([-ExteriorWidth/2,-ExteriorDepth/2-10-2.5, 30]) rotate([180,0,0]) C2020();
        
        
        // Top Frame
        translate([0,-ExteriorDepth/2,Height-10]) cube([ExteriorWidth-20,20,20],center=true);
        translate([0,ExteriorDepth/2,Height-10]) cube([ExteriorWidth-20,20,20],center=true);
        
        translate([-ExteriorWidth/2,0,Height-10]) cube([20,ExteriorDepth-20,20],center=true);
        translate([ExteriorWidth/2,0,Height-10]) cube([20,ExteriorDepth-20,20],center=true);
        
        //Bottom Frame
        translate([0,-ExteriorDepth/2,10]) cube([ExteriorWidth-20,20,20],center=true);
        translate([0,ExteriorDepth/2,10]) cube([ExteriorWidth-20,20,20],center=true);
        
        translate([-ExteriorWidth/2,0,10]) cube([20,ExteriorDepth-20,20],center=true);
        translate([ExteriorWidth/2,0,10]) cube([20,ExteriorDepth-20,20],center=true);
  
    }
    
    enclosure();
   

    
    bottom_plate();
    top_side_plate();
    
    color("lightgrey"){
        // Z Axis Linear Sliders
        for (y=ZAxisLinearRodOffsetsFromFront){
            translate([ExteriorWidth/2+10-ZAxisSideOffset,(ExteriorDepth/2+10)-y,23.5]) cylinder(r=8/2,h=500);
            translate([-ExteriorWidth/2-10+ZAxisSideOffset,(ExteriorDepth/2+10)-y,23.5]) cylinder(r=8/2,h=500);
        }
    
    
        // Z Axis Lead Screw
        translate([ExteriorWidth/2+10-ZAxisSideOffset,(ExteriorDepth/2+10)-ZAxisMotorOffset,23.5]) cylinder(r=8/2,h=500);
        translate([-ExteriorWidth/2-10+ZAxisSideOffset,(ExteriorDepth/2+10)-ZAxisMotorOffset,23.5]) cylinder(r=8/2,h=500);
    }
    
    // Y rail
    translate([-InteriorWidth/2,0,XYCarriageHeight+Extrusion2020Height/2]) mgn12_y_rail();
    translate([InteriorWidth/2,0,XYCarriageHeight+Extrusion2020Height/2]) mgn12_y_rail();
    
    // X rail 
    translate([0,0,XYCarriageHeight+Extrusion2020Height/2]) mgn12_y_block() translate([0,0,10+XCarriageMountHeight]) {
           color("lightgrey") cube([X2020Length,20,20],center=true);
           translate([0,0,10]) mgn12_x_rail(length=400,block=400/2);
           translate([0,0,10]) mgn12_x_block() EVAHemeraCarriage();
    }

   
    // Place all the lower pulleys
    color("cyan"){
        blue_motor_pulley() cylinder(r=MotorPulleyDWB/2,h=MotorPulleyH,center=true);  
        blue_xaxis_pulley_from_motor() cylinder(r=XPulleySmoothDWB/2,h=XPulleySmoothH,center=true);
        blue_rear_left_pulley() cylinder(r=CornerPDWN/2,h=CornerPH,center=true);
        blue_rear_right_pulley() cylinder(r=CornerPDWN/2,h=CornerPH,center=true);
        blue_xaxis_pulley_from_rear() cylinder(r=XPulleyToothedDWB/2,h=XPulleyToothedH,center=true);
    }
    
    // Place all the lower pulleys
    color("pink"){
        red_motor_pulley() cylinder(r=MotorPulleyDWB/2,h=MotorPulleyH,center=true);  
        red_xaxis_pulley_from_motor() cylinder(r=XPulleySmoothDWB/2,h=XPulleySmoothH,center=true);
        red_rear_left_pulley() cylinder(r=CornerPDWN/2,h=CornerPH,center=true);
        red_rear_right_pulley() cylinder(r=CornerPDWN/2,h=CornerPH,center=true);
        red_xaxis_pulley_from_rear() cylinder(r=XPulleyToothedDWB/2,h=XPulleyToothedH,center=true);
    }
    
    red_belt_path();
    blue_belt_path();
   
    /*
    red_motor_pulley() translate([0,0,10]) color("darkgrey") nema17();
    blue_motor_pulley() translate([0,0,10]) color("darkgrey") nema17();*/


    z_axis_plate();

    // Draw the bed in to give some idea of where the extruder needs to travel
    translate([0,BedCenterY,XYCarriageHeight-40]) {      
        color("lightgrey") difference(){
            translate([0,0,20]) cube([BedX,BedY,2],center=true);
                for (x=[-321/2,321/2]){
                    for(y=[-321/2,321/2]){
                        translate([x,y,0]) cylinder(r=3.5/2,h=100,center=true);
                    }
                }
        }
    }
    
 
}


module top_side_plate(){
    //FIXME remove 2020 cut outs
    width=(ExteriorWidth-InteriorWidth)/2+20;
    difference(){
        union(){
            translate([-InteriorWidth/2-width/2+10,0,XYCarriageHeight-10-2.5]) cube([width,ExteriorDepth+20,5],center=true);
            translate([InteriorWidth/2+width/2-10,0,XYCarriageHeight-10-2.5]) cube([width,ExteriorDepth+20,5],center=true);
        }

        for(x=[-ExteriorWidth/2,ExteriorWidth/2]){
            for(y=[-ExteriorDepth/2,ExteriorDepth/2]){
                  translate([x,y,Height/2]) cube([21,21,Height],center=true); 
            }
        }

        for (y=ZAxisLinearRodOffsetsFromFront){
                translate([ExteriorWidth/2+10-ZAxisSideOffset,(ExteriorDepth/2+10)-y,0]) {
                    cylinder(r=10/2,h=1000);
                    for(y=[-43/2,43/2]){
                        translate([0,y,0]) cylinder(r=5.5/2,h=1000);
                    }
                }
                translate([-ExteriorWidth/2-10+ZAxisSideOffset,(ExteriorDepth/2+10)-y,0]) {
                    cylinder(r=10/2,h=1000);
                    for (y=[-43/2,43/2]){
                         translate([0,y,0]) cylinder(r=5.5/2,h=1000); 
                    }
                }
            }
            translate([ExteriorWidth/2+10-ZAxisSideOffset,(ExteriorDepth/2+10)-ZAxisMotorOffset,0]){
                cylinder(r=10/2,h=1000);
                for (y=[-48/2,48/2]){
                         translate([0,y,0]) cylinder(r=5.5/2,h=1000); 
                }
            }
            translate([-ExteriorWidth/2-10+ZAxisSideOffset,(ExteriorDepth/2+10)-ZAxisMotorOffset,0]){
                cylinder(r=10/2,h=1000);
                for (y=[-48/2,48/2]){
                         translate([0,y,0]) cylinder(r=5.5/2,h=1000); 
                }
        }
        
        for(y=[-200:100:200]){
            translate([ExteriorWidth/2,y,0]) cylinder(r=5.5/2,h=1000);
            translate([-ExteriorWidth/2,y,0]) cylinder(r=5.5/2,h=1000);
            
            translate([InteriorWidth/2,y,0]) cylinder(r=5.5/2,h=1000);
            translate([-InteriorWidth/2,y,0]) cylinder(r=5.5/2,h=1000);
        }
    }
}


module z_axis_plate(){
    // Draw the bed in to give some idea of where the extruder needs to travel
    difference(){
        translate([0,BedCenterY,XYCarriageHeight-40]) {
            difference(){
                minkowski(){
                    cube([InteriorWidth+20,BedY+10,2],center=true);
                    cylinder(r=20/2,h=2);
                }
                for (x=[-321/2,321/2]){
                    for(y=[-321/2,321/2]){
                        translate([x,y,0]) cylinder(r=3.5/2,h=100,center=true);
                    }
                }
                // Sidewinder X1 mounting holes
                for (x=[-(310-55)/2,(310-55)/2]){
                    for(y=[-(310-55)/2,(310-55)/2]){
                        translate([x,y,0]) cylinder(r=5.5/2,h=100,center=true);
                    }
                }
                for(x=[-80,80]){
                    for(y=[-80,80]){
                        translate([x,y,0]) cylinder(r=130/2,h=100,$fn=6,center=true);
                    }
                }
            }
           
        }
        for (y=ZAxisLinearRodOffsetsFromFront){
            translate([ExteriorWidth/2+10-ZAxisSideOffset,(ExteriorDepth/2+10)-y,0]) {
                cylinder(r=16/2,h=1000);
                for (a=[0:360/4:360]){
                     rotate([0,0,a+45]) translate([0,12,0]) cylinder(r=2.9/2,h=1000); 
                }
            }
            translate([-ExteriorWidth/2-10+ZAxisSideOffset,(ExteriorDepth/2+10)-y,0]) {
                cylinder(r=16/2,h=1000);
               
                for (a=[0:360/4:360]){
                     rotate([0,0,a+45]) translate([0,12,0]) cylinder(r=2.9/2,h=1000); 
                }
            }
        }
        translate([ExteriorWidth/2+10-ZAxisSideOffset,(ExteriorDepth/2+10)-ZAxisMotorOffset,0]){
            cylinder(r=12/2,h=1000);
            for (a=[0:360/4:360]){
                     rotate([0,0,a+45]) translate([0,16,0]) cylinder(r=2.9/2,h=1000); 
            }
        }
        translate([-ExteriorWidth/2-10+ZAxisSideOffset,(ExteriorDepth/2+10)-ZAxisMotorOffset,0]){
            cylinder(r=12/2,h=1000);
            for (a=[0:360/4:360]){
                     rotate([0,0,a+45]) translate([0,16,0]) cylinder(r=2.9/2,h=1000); 
            }
        }
    }
}

module skr1_4_holes(){
     for(x=[-101.85/2,101.85/2]){
            for(z=[-76.3/2,76.3/2]){
                translate([x,0,z]) rotate([90,0,0]) cylinder(r=4/3,h=100,center=true);
            }
     }
}

module skr1_4(){
    difference(){
        cube([109.67,1,84.3],center=true);
        skr1_4_holes();
    }
}

module power_supply_holes(){
     for(x=[-150/2,150/2]){
            for(z=[-50/2,50/2]){
                translate([x,0,z]) rotate([90,0,0]) cylinder(r=4.5/3,h=100,center=true);
            }
     }
}

module fan_80mm_holes(){
     s=71.5;
     for(x=[-s/2,s/2]){
            for(z=[-s/2,s/2]){
                translate([x,0,z]) rotate([90,0,0]) cylinder(r=4.5/3,h=100,center=true);
            }
     }
}

module fan_80mm(){
     difference(){
        cube([80,25,80],center=true);
        rotate([90,0,0]) cylinder(r=76.3/2,h=100,center=true);
        fan_80mm_holes();
    }
}

module power_supply(){
    //https://www.amazon.com/gp/product/B07VRK86SP/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1
    difference(){
        cube([215,30,115],center=true);
        power_supply_holes();
    }
}

module pi_4_holes(){
     for(x=[-58/2,58/2]){
            for(z=[-49/2,49/2]){
                translate([x-58/2-(85/2)+3.5+58,0,z]) rotate([90,0,0]) cylinder(r=4/3,h=100,center=true);
            }
     }
}

module pi_4(){
     difference(){
        cube([85,1,56],center=true);
        pi_4_holes();
    }
}
module enclosure(){
     // Enclosure
    translate([0,-ExteriorDepth/2+EnclosureDepth/2-15,20+7+EnclosureHeight/2]) {
        difference(){
            cube([EnclosureWidth,EnclosureDepth,EnclosureHeight],center=true);
            translate([0,-5,-5]) cube([EnclosureWidth-10,EnclosureDepth,EnclosureHeight],center=true);
        }
        
    }
    // Electronics 
   // skr1_4();
    //power_supply();
    //fan_80mm();
    //translate([0,0,90]) pi_4();
}

module bottom_plate(){
    //FIXME needs to be verified with pulleys
    // Needs slightly larger cutouts for the corners
    // Should have rail mount support instead of lead screws
    // Needs to be verified
   
     // Bottom Plate
    difference(){
        translate([0,0,23.5]) cube([ExteriorWidth+20,ExteriorDepth+20,7],center=true);
        
        for(x=[-ExteriorWidth/2,ExteriorWidth/2]){
            for(y=[-ExteriorDepth/2,ExteriorDepth/2]){
                  translate([x,y,Height/2]) cube([21,21,Height],center=true); 
            }
        }
        // From front
        // 16D @ 117 from front / 58mm from side
        // 12D @ 215.5 from front / 
        // 16D @ 317 from front / 
        for (y=ZAxisLinearRodOffsetsFromFront){
            translate([ExteriorWidth/2+10-ZAxisSideOffset,(ExteriorDepth/2+10)-y,0]) {
                cylinder(r=12/2,h=100);
                for(y=[-43/2,43/2]){
                    translate([0,y,0]) cylinder(r=5.5/2,h=100);
                }
            }
            translate([-ExteriorWidth/2-10+ZAxisSideOffset,(ExteriorDepth/2+10)-y,0]) {
                cylinder(r=12/2,h=100);
                for (y=[-43/2,43/2]){
                     translate([0,y,0]) cylinder(r=5.5/2,h=100); 
                }
            }
        }
        translate([ExteriorWidth/2+10-ZAxisSideOffset,(ExteriorDepth/2+10)-ZAxisMotorOffset,0]){
            cylinder(r=12/2,h=100);
            for (y=[-48/2,48/2]){
                     translate([0,y,0]) cylinder(r=5.5/2,h=100); 
            }
        }
        translate([-ExteriorWidth/2-10+ZAxisSideOffset,(ExteriorDepth/2+10)-ZAxisMotorOffset,0]){
            cylinder(r=12/2,h=100);
            for (y=[-48/2,48/2]){
                     translate([0,y,0]) cylinder(r=5.5/2,h=100); 
            }
        }
        
        z_axis_pulley_d=27.5;
        // FIXME find the pulley offset for the larger pulleys
        for(y=[0:1:15]){
            translate([0,(ExteriorDepth/2+10)-ZAxisMotorOffset+y+z_axis_pulley_d/2+10,0]) {
            cylinder(r=22.5/2,h=100);
                for (sx=[-31/2,31/2]){
                    for (sy=[-31/2,31/2]){
                        translate([sx,sy,0]) cylinder(r=3.5/2,h=100);
                    }
                }
               
            }
            
        }
        translate([0,(ExteriorDepth/2+10)-ZAxisMotorOffset+z_axis_pulley_d/2+10/2,0]) {
            for(sx=[-60/2,60/2]){
                translate([sx,0,0]) cylinder(r=4.8/2,h=100);
            }
        }
        
        for(y=[-200:100:200]){
            translate([ExteriorWidth/2,y,0]) cylinder(r=5.5/2,h=100);
            translate([-ExteriorWidth/2,y,0]) cylinder(r=5.5/2,h=100);
        }
        
        for(x=[-200:100:200]){
            translate([x,ExteriorDepth/2,0]) cylinder(r=5.5/2,h=100);
            translate([x,-ExteriorDepth/2,0]) cylinder(r=5.5/2,h=100);
        }
        
        // Enclosure holes
        a1=5.5*25.4;
        translate([ExteriorWidth/2-a1+10,-ExteriorDepth/2+75-10,0]) cylinder(r=4/2,h=1000);
        translate([-ExteriorWidth/2+a1-10,-ExteriorDepth/2+75-10,0]) cylinder(r=4/2,h=1000);
       

        a2=1*25.4;
        translate([ExteriorWidth/2-a2+10,-ExteriorDepth/2+30,0]) cylinder(r=4/2,h=1000);
        translate([-ExteriorWidth/2+a2-10,-ExteriorDepth/2+30,0]) cylinder(r=4/2,h=1000);
        
       
    }
}

module C2020 (){
    difference(){
        hull(){
                cube([20,5,60],center=true);
                translate([20,0,20]) cube([60,5,20],center=true);
               
        }
        for(z=[-20,0,20]){
            translate([0,0,z]) rotate([90,0,0]) cylinder(r=5.1/2,h=30,center=true);
        }
        for(x=[-20,0,20]){
            translate([x+20,0,20]) rotate([90,0,0]) cylinder(r=5.1/2,h=30,center=true);
        }
    }
    for(z=[-20,0,20]){
            translate([0,0,z]) rotate([90,0,0]) cylinder(r=9/2,h=15,center=true);
    }
    for(x=[-20,0,20]){
            translate([x+20,0,20]) rotate([90,0,0]) cylinder(r=9/2,h=15,center=true);
    }
}



module T2020 (){
    difference(){
        hull(){
                cube([20,5,60],center=true);
                translate([20,0,0]) cube([60,5,20],center=true);
               
        }
        for(z=[-20,0,20]){
            translate([0,0,z]) rotate([90,0,0]) cylinder(r=5.1/2,h=30,center=true);
        }
        for(x=[-20,0,20]){
            translate([x+20,0,0]) rotate([90,0,0]) cylinder(r=5.1/2,h=30,center=true);
        }
    }
    for(z=[-20,0,20]){
            translate([0,0,z]) rotate([90,0,0]) cylinder(r=9/2,h=15,center=true);
    }
    for(x=[-20,0,20]){
            translate([x+20,0,0]) rotate([90,0,0]) cylinder(r=9/2,h=15,center=true);
    }
}


module rear_left_pulley_mount(){
    difference(){
        union(){
            translate([0,0,UpperBeltHeight-LowerBeltHeight+CornerPH/2+5/2]) union(){
                hull(){
                    red_rear_left_pulley() cylinder(r=CornerPDWN/2+10/2,h=5,center=true);
                    translate([ExteriorWidth/2-2.5,-ExteriorDepth/2+2.5,LowerBeltHeight])cube([25,25,5],center=true);
                }
            }    
            
            
            //25mm bolt
            //blue_rear_left_pulley() translate([0,0,-5]) cylinder(r=5.1/2,h=30,center=true);
           translate([0,0,-CornerPH/2-5/2]) union(){
                hull(){
                    red_rear_left_pulley() cylinder(r=CornerPDWN/2+10/2,h=5,center=true);
                    translate([ExteriorWidth/2-2.5,-ExteriorDepth/2+2.5,LowerBeltHeight])cube([25,25,5],center=true);
                }
                translate([ExteriorWidth/2-15,-ExteriorDepth/2-10,LowerBeltHeight])
                    cube([25,25,UpperBeltHeight-LowerBeltHeight+15+2*CornerPulleyMountSpacer]);
           }
          
        }
        
        
        

        
        blue_rear_left_pulley() translate([0,0,8]) M5x25M_ShoulderBolt();
        red_rear_left_pulley() translate([0,0,20]) M5x25M_ShoulderBolt();
       
        // FIXME This is not calculated correctly from a height perspective
        translate([ExteriorWidth/2,-ExteriorDepth/2,(LowerBeltHeight+CornerPH+CornerPulleyMountSpacer)-5.1]){
            rotate([90,0,0]) cylinder(r=5.3/2,h=100,center=true);
            rotate([0,90,0]) cylinder(r=5.3/2,h=100,center=true);
            // cylinder(r=5.5/2,h=100,center=true);
            //cube([200,6,10],center=true);
            cube([20.1,20.1,100],center=true);
        }


    }
}

module rear_right_pulley_mount(){
    mirror([1,0,0]) rear_left_pulley_mount();
}

module x_endstop_placement(){
        translate([-InteriorWidth/2+10,-ExteriorDepth/2+60,XYCarriageHeight-10]) children();
}

module x_endstop_rail_mount(){
    x_endstop_placement() {
        difference(){
            union(){
                cube([3,30,20]);
                cube([3,15,27]);

                translate([0,0,27]) cube([30,15,3]);
                translate([0,0,25]) cube([30,2,5]);


        
            }
            translate([10,7,10]) rotate([0,90,0]) cylinder(r=4.2/2,h=100,center=true); 
            translate([10,24,10]) rotate([0,90,0]) cylinder(r=4.2/2,h=100,center=true);      
            for(x=[-5:1:10]){
                    translate([x+15,9,26])cylinder(r=3.2/2,h=100);
            }
        }
    }
}

module x_endstop_sensor_mount(){
    x_endstop_placement() {
        difference(){
       
            union(){

                translate([12.5,2,25]) cube([18,38,3]);

                
                translate([16.3-3.5+14,40.6-3.5,25]) rotate([0,0,0]) cylinder(r=7/2,h=5,center=true);
                translate([16.3-3.5+14,40.6-3.5-19,25]) rotate([0,0,0]) cylinder(r=7/2,h=5,center=true);
                
                
              
                translate([21,9,25])cylinder(r=5/2,h=5,center=true);
                
            }
            translate([10,7,10]) rotate([0,90,0]) cylinder(r=4.2/2,h=100,center=true); 
            translate([10,30,10]) rotate([0,90,0]) cylinder(r=4.2/2,h=100,center=true); 
            
            translate([21,9,23])cylinder(r=2.9/2,h=50,center=true);

           
            translate([16.3-3.5+14,40.6-3.5,22]) rotate([0,0,0]) cylinder(r=2.9/2,h=150,center=true);
            translate([16.3-3.5+14,40.6-3.5-19,22]) rotate([0,0,0]) cylinder(r=2.9/2,h=150,center=true);
        }
    }
}

module x_endstop_mount(){
    x_endstop_rail_mount();
    x_endstop_sensor_mount();

}

module x_endstop(){
    x_endstop_placement() translate([13,0,22])   rotate([180,0,90]) import("models/MakerBot_Endstop.stl");
}



module y_endstop(){
    //https://www.thingiverse.com/thing:2405504/files
    y_endstop_placement() rotate([0,0,0]) translate([0,0,11]) import("models/MakerBot_Endstop.stl");
}

module y_endstop_placement(){
    translate([-ExteriorWidth/2-10,-ExteriorDepth/2+60,XYCarriageHeight+Extrusion2020Height/2]) children();
}

module y_endstop_mount(){
    y_endstop_placement() {
        difference(){
            union(){
                translate([0,-5,0]) cube([40.6,35,3]);
                  
                rotate([0,0,0]) {
                    translate([40.6-3.5,16.3-3.5,0]){
                        cylinder(r=7/2,h=11);
                    }
       

                    translate([40.6-3.5-19,16.3-3.5,0]){
                        cylinder(r=7/2,h=11);
                    }
                }
            }
            
            translate([10,25,0]) difference(){
                cylinder(r=5.2/2,h=20,center=true);
            }
            
            translate([10,0,0]) difference(){
                cylinder(r=5.2/2,h=20,center=true);
            }
             
            rotate([0,0,0]){
                translate([40.6-3.5,16.3-3.5,0]){
                    cylinder(r=2.9/2,h=11);
                }
       

                translate([40.6-3.5-19,16.3-3.5,0]){
                    cylinder(r=2.9/2,h=11);
                }
            }

        }
    
     
       // translate([0,0,12]) endstop();
    }
}


// This used to properly drill a carbon fiber 20x20 rail
module xy_carriage_mount_cf_tube_upper_drill_jig(){
    $fn=30;
    // Y rail
    {
       
        
        difference(){
            union(){
                          

          
                   translate([InteriorWidth/2+25,0,XYCarriageHeight+10]) mgn12_y_block() translate([-10,0,5/2+Extrusion2020Height+XCarriageMountHeight]) { 
                       
                        difference(){
                            translate([-100,0,0]) cube([250,25,6],center=true);
                            translate([-100,0,-3]) cube([250,20.6,5],center=true);
                        }
                    }
                    translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() translate([-10,0,5/2+Extrusion2020Height+XCarriageMountHeight]) {
                         difference(){
                            cube([35,25,6],center=true);
                            translate([0,0,-3]) cube([50,20.6,5],center=true);
                        }
                    }
                        

                
                 
            }
            for(x=[0:25:175]) {
                 translate([x+12.5,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=3.1/2,h=100,center=true);
            }
            translate([InteriorWidth/2+33,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);
        }
       
    }
}

//xy_carriage_mount_cf_tube_upper_drill_jig();

module xy_carriage_mount_upper_cf_tube(){
    // Y rail
    {
       
        difference(){
            union(){
                           //blue_xaxis_pulley_from_motor() translate([0,0,-5]) cylinder(r=6.3/2,h=30,center=true);

                hull(){
                   translate([InteriorWidth/2+25,0,XYCarriageHeight+10]) mgn12_y_block() translate([-10,0,5/2+Extrusion2020Height+XCarriageMountHeight]) { 
                       cube([50,20,5],center=true);
                       
                   }    
                    
                    
                    blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2+Extrusion2020Height+XCarriageMountHeight]) 
                        cylinder(r=XPulleySmoothDWB/2+2,h=5);
                    red_xaxis_pulley_from_rear() translate([0,0,XYCarriageHeight-LowerBeltHeight++MGN12Height+Extrusion2020Height/2+Extrusion2020Height+XCarriageMountHeight]) 
                        cylinder(r=XPulleyToothedDWB/2+2,h=5);
                }
                
                translate([InteriorWidth/2+28,0,XYCarriageHeight+10-2.5]) mgn12_y_block() translate([-10,0,5/2+Extrusion2020Height+XCarriageMountHeight]) { 
                       cube([40,28,10],center=true);   
                   }
                 
            }
             translate([InteriorWidth/2+25,0,XYCarriageHeight-2.5]) mgn12_y_block() translate([-10,0,5/2+Extrusion2020Height+XCarriageMountHeight]) { 
                       cube([50,20.6,20],center=true);   
                   }
            
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() {
                for(x=[-10,10]){
                    for(y=[-10,10]){
                           translate([x,y,5]) cylinder(r=6.2/2,h=10);
                           translate([x,y,-1]) cylinder(r=3.1/2,h=10);
                    }
                }
            }
            /*
            blue_xaxis_pulley_from_motor() cylinder(r=5.3/2,h=100,center=true);
            red_xaxis_pulley_from_rear() cylinder(r=5.3/2,h=100,center=true);*/
            blue_xaxis_pulley_from_motor() translate([0,0,8]) M5x25M_ShoulderBolt();
            red_xaxis_pulley_from_rear()translate([0,0,20]) M5x25M_ShoulderBolt();
        
            blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2+Extrusion2020Height+XCarriageMountHeight+5]) translate([-2,-8,-0.5]) linear_extrude(1) text("F",size=5,valign="center");
            
            
            translate([InteriorWidth/2+33,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);

            translate([InteriorWidth/2+33,0,XYCarriageHeight+45]) mgn12_y_block() cylinder(r=10/2,h=10,center=true);
            translate([InteriorWidth/2,0,XYCarriageHeight+45]) mgn12_y_block() cylinder(r=10/2,h=10,center=true);
        }
       
    }
  
}

module xy_carriage_mount_upper_al_2020(){
    // Y rail
    {
       
        difference(){
            union(){
                           //blue_xaxis_pulley_from_motor() translate([0,0,-5]) cylinder(r=6.3/2,h=30,center=true);

                hull(){
                   translate([InteriorWidth/2+25,0,XYCarriageHeight+10]) mgn12_y_block() translate([-10,0,5/2+Extrusion2020Height+XCarriageMountHeight]) { 
                       cube([50,20,5],center=true);
                       
                   }    
                    
         
                     
                    
                    blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2+Extrusion2020Height+XCarriageMountHeight]) 
                        cylinder(r=XPulleySmoothDWB/2+2,h=5);
                    red_xaxis_pulley_from_rear() translate([0,0,XYCarriageHeight-LowerBeltHeight++MGN12Height+Extrusion2020Height/2+Extrusion2020Height+XCarriageMountHeight]) 
                        cylinder(r=XPulleyToothedDWB/2+2,h=5);
                }
                
                 
            }
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() {
                for(x=[-10,10]){
                    for(y=[-10,10]){
                           translate([x,y,5]) cylinder(r=6.2/2,h=10);
                           translate([x,y,-1]) cylinder(r=3.1/2,h=10);
                    }
                }
            }
            /*
            blue_xaxis_pulley_from_motor() cylinder(r=5.3/2,h=100,center=true);
            red_xaxis_pulley_from_rear() cylinder(r=5.3/2,h=100,center=true);*/
            blue_xaxis_pulley_from_motor() translate([0,0,8]) M5x25M_ShoulderBolt();
            red_xaxis_pulley_from_rear()translate([0,0,20]) M5x25M_ShoulderBolt();
        
            blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2+Extrusion2020Height+XCarriageMountHeight+5]) translate([-2,-8,-0.5]) linear_extrude(1) text("F",size=5,valign="center");
            
            
            translate([InteriorWidth/2+33,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);

        }
       
    }
  
}

module M5x25M_ShoulderBolt(){
    cylinder(r=10.5/2,h=3);
    translate([0,0,-25]) cylinder(r=5.15/2,h=25);
    translate([0,0,-25-9]) cylinder(r=3.4/2,h=9);
}

module xy_carriage_mount_lower_cf_tube(){
    // Y rail
    {
       
        difference(){
            union(){
                translate([InteriorWidth/2+10,0,XYCarriageHeight+10]) mgn12_y_block() translate([-2.5,0,XCarriageMountHeight/2]) 
                cube([50,20,XCarriageMountHeight],center=true);
                hull(){
                    translate([InteriorWidth/2-4,0,XYCarriageHeight+10]) mgn12_y_block() translate([0,0,5/2]) cube([20,40,5],center=true);
                    translate([InteriorWidth/2+15,0,XYCarriageHeight+10]) mgn12_y_block() translate([0,0,5/2]) cube([50,20,5],center=true);
                    
                    blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2]) 
                        cylinder(r=XPulleySmoothDWB/2+2,h=5);
                    red_xaxis_pulley_from_rear() translate([0,0,XYCarriageHeight-LowerBeltHeight++MGN12Height+Extrusion2020Height/2]) 
                        cylinder(r=XPulleyToothedDWB/2+2,h=5);
                    
                    
                    
                }
                translate([InteriorWidth/2+15+3,0,XYCarriageHeight+10+5]) mgn12_y_block() translate([0,0,5/2]) cube([40,27,10],center=true);
                
              
            }
            
            translate([InteriorWidth/2+25,0,XYCarriageHeight-2.5]) mgn12_y_block() translate([-10,0,5/2+Extrusion2020Height+XCarriageMountHeight]) { 
                cube([500,20.6,20],center=true);   
            }
            
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() {
                for(x=[-10,10]){
                    for(y=[-10,10]){
                           translate([x,y,5]) cylinder(r=6.2/2,h=10);
                           translate([x,y,-1]) cylinder(r=3.1/2,h=10);
                    }
                }
            }
  
            
            blue_xaxis_pulley_from_motor() translate([0,0,8]){ 
                M5x25M_ShoulderBolt();
                translate([0,0,-28]) cylinder(r=4.5/2,h=40,center=true);
                translate([0,0,-28]) cylinder(r=5.9/2,h=4,center=true);
            }
            red_xaxis_pulley_from_rear() translate([0,0,20]){
                translate([0,0,-28]) cylinder(r=4.5/2,h=40,center=true);
                translate([0,0,-28]) cylinder(r=5.9/2,h=4,center=true);
            }
            
            blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2+5]) translate([-2,-6,-0.5]) linear_extrude(2) text("F",size=5,valign="center");
            
            translate([InteriorWidth/2+33,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.2/2,h=100,center=true);
          
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.2/2,h=100,center=true);  
            
            translate([InteriorWidth/2+33,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=9/2,h=4,$fn=6);
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=9/2,h=4,$fn=6);
        }
        
    }
  
}

module xy_carriage_mount_lower_al_2020(){
    // Y rail
    {
       
        difference(){
            union(){
                translate([InteriorWidth/2+10,0,XYCarriageHeight+10]) mgn12_y_block() translate([-2.5,0,XCarriageMountHeight/2]) cube([65,20,XCarriageMountHeight],center=true);
                hull(){
                    translate([InteriorWidth/2-4,0,XYCarriageHeight+10]) mgn12_y_block() translate([0,0,5/2]) cube([20,40,5],center=true);
                     translate([InteriorWidth/2+15,0,XYCarriageHeight+10]) mgn12_y_block() translate([0,0,5/2]) cube([50,20,5],center=true);
                    
                    blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2]) 
                        cylinder(r=XPulleySmoothDWB/2+2,h=5);
                    red_xaxis_pulley_from_rear() translate([0,0,XYCarriageHeight-LowerBeltHeight++MGN12Height+Extrusion2020Height/2]) 
                        cylinder(r=XPulleyToothedDWB/2+2,h=5);
                }
              
            }
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() {
                for(x=[-10,10]){
                    for(y=[-10,10]){
                           translate([x,y,5]) cylinder(r=6.2/2,h=10);
                           translate([x,y,-1]) cylinder(r=3.1/2,h=10);
                    }
                }
            }
            //blue_xaxis_pulley_from_motor() cylinder(r=5.3/2,h=100,center=true);
            //red_xaxis_pulley_from_rear() cylinder(r=5.3/2,h=100,center=true);
            
            blue_xaxis_pulley_from_motor() translate([0,0,8]) M5x25M_ShoulderBolt();
            red_xaxis_pulley_from_rear()translate([0,0,20]) M5x25M_ShoulderBolt();
            
            blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2+5]) translate([-2,-8,-0.5]) linear_extrude(2) text("F",size=5,valign="center");
            
            translate([InteriorWidth/2+33,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);
          
            translate([InteriorWidth/2-19,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);
            
            translate([InteriorWidth/2+33,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=9/2,h=3);
            translate([InteriorWidth/2-19,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=9/2,h=3);
        }
        
    }
  
}

module blue_motor_mount(){
   
    difference(){
        union(){
            blue_motor_pulley() translate([0,0,10]) cube([45,45,5],center=true);
            translate([ExteriorWidth/2,ExteriorDepth/2-2.5,UpperBeltHeight+23]) cube([30,25,50],center=true);
            
            hull(){
                translate([ExteriorWidth/2-10,ExteriorDepth/2-12,UpperBeltHeight+23]) cube([50,5,50],center=true);
                translate([ExteriorWidth/2-10,ExteriorDepth/2-55,UpperBeltHeight+10]) cube([50,5,10],center=true);
            }
            
            hull(){
                translate([ExteriorWidth/2-5,ExteriorDepth/2,UpperBeltHeight+23+25-2.5]) cube([20,20,5],center=true);
                translate([ExteriorWidth/2-10,ExteriorDepth/2-10,UpperBeltHeight+23+25-2.5]) cube([50,5,5],center=true);
            }
            
            hull(){
                translate([ExteriorWidth/2-5,ExteriorDepth/2,UpperBeltHeight+23-25+2.5]) cube([20,20,5],center=true);
                translate([ExteriorWidth/2-10,ExteriorDepth/2-10,UpperBeltHeight+23-25+2.5]) cube([50,5,5],center=true);
            } 
        } 
        
        blue_motor_pulley() translate([0,0,-5]) cube([40,40,25],center=true);

        blue_motor_pulley() translate([0,0,10.5]) nema17_cutout();
        translate([ExteriorWidth/2,ExteriorDepth/2,UpperBeltHeight+10]){
            cube([20.1,20.1,100],center=true);
        }
        for(z=[0,26]){
            translate([ExteriorDepth/2+20,ExteriorWidth/2-20,UpperBeltHeight+10+z]){
                rotate([0,90,0]) cylinder(r=5.3/2,h=100,center=true);
            }
        }
        //translate([ExteriorDepth/2+20,ExteriorWidth/2-20,UpperBeltHeight+10+9]) cube([30,5.5,10],center=true);

    }
}

module red_motor_mount(){
    
    difference(){
        union(){
            red_motor_pulley() translate([0,0,10]) cube([45,45,5],center=true);
            translate([-ExteriorWidth/2,ExteriorDepth/2-2.5,LowerBeltHeight+23]) cube([30,25,50],center=true);
            
            hull(){
                translate([-ExteriorWidth/2+10,ExteriorDepth/2-12.5,LowerBeltHeight+23]) cube([50,5,50],center=true);
                translate([-ExteriorWidth/2+10,ExteriorDepth/2-55,LowerBeltHeight+10]) cube([50,5,5],center=true);
            }
            
            hull(){
                translate([-ExteriorWidth/2+5,ExteriorDepth/2,LowerBeltHeight+23+25-2.5]) cube([20,20,5],center=true);
                translate([-ExteriorWidth/2+10,ExteriorDepth/2-10,LowerBeltHeight+23+25-2.5]) cube([50,5,5],center=true);
            }
            
            hull(){
                translate([-ExteriorWidth/2+5,ExteriorDepth/2,LowerBeltHeight+23-25+2.5]) cube([20,20,5],center=true);
                translate([-ExteriorWidth/2+10,ExteriorDepth/2-10,LowerBeltHeight+23-25+2.5]) cube([50,5,5],center=true);
            }
            
             translate([-ExteriorWidth/2+35,ExteriorDepth/2-25,LowerBeltHeight+30]) rotate([-45,0,0])  
                scale([0.9,1.2,1]) difference(){
                    cylinder(r=9/2,h=3,center=true);
                    cylinder(r=5/2,h=3,center=true);

                }
            
        } 
        red_motor_pulley() translate([0,0,10.5]) nema17_cutout();
        red_motor_pulley() translate([0,0,-5]) cube([40,40,25],center=true);
        translate([-ExteriorWidth/2,ExteriorDepth/2,LowerBeltHeight+10]){
            cube([20.1,20.1,100],center=true);
        }
        for(z=[0,26]){
            translate([-ExteriorDepth/2-20,ExteriorWidth/2-20,LowerBeltHeight+10+z]){
                rotate([0,90,0]) cylinder(r=5.3/2,h=100,center=true);
            }
        }
    }
    
}






// The top center of the block the extruder should be mounted to
module xy_block(){
    // X rail
    translate([0,0,XYCarriageHeight+10]) mgn12_y_block() translate([0,0,10+XCarriageMountHeight]) {
       translate([0,0,10]) mgn12_x_block() children();
    }
}
 
// Blue belt location definitions

function blue_motor_x() = ExteriorWidth/2-11;


module blue_motor_pulley(){
    translate([blue_motor_x(),ExteriorDepth/2-MotorY/2-13,UpperBeltHeight]) children();
}

module blue_xaxis_pulley_from_motor(){
    translate([ blue_motor_x()-MotorPulleyDWB/2-XPulleySmoothDWB/2+BeltThickness,
                InteriorDepth/2-YLocation + XPulleySmoothDWB/2+EVAFrontBeltY-BeltThickness/2,
                UpperBeltHeight])  
                children();
}

module blue_rear_left_pulley(){
    translate([blue_motor_x(),
              -ExteriorDepth/2+RearPulleyOffset*2.5,
                UpperBeltHeight
            ]) children();
}

module blue_rear_right_pulley(){
    translate([
        // B1: This X value MUST be the same as the X value B2
        -blue_motor_x()+MotorPulleyDWB/2+XPulleySmoothDWB/2-BeltThickness,
        -ExteriorDepth/2+RearPulleyOffset*3.6,
        UpperBeltHeight]) children();
}

module blue_xaxis_pulley_from_rear(){
    translate([
        // B2: This X value MUST be the same as the X value for B1
        -blue_motor_x()+MotorPulleyDWB/2+XPulleySmoothDWB/2-BeltThickness,
        InteriorDepth/2-YLocation-XPulleySmoothDWB/2+EVABackBeltY+BeltThickness/2,
        UpperBeltHeight])  children(); 
}

module blue_belt_path(BeltThickness=BeltThickness,BelthHeight=BeltHeight){
 // Create the blue belt path 
    color("blue"){
        hull(){
            blue_motor_pulley() 
                translate([-MotorPulleyDWB/2+BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            blue_xaxis_pulley_from_motor() 
                translate([XPulleySmoothDWB/2-BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
            blue_xaxis_pulley_from_motor() 
                translate([0,-XPulleySmoothDWB/2+BeltThickness/2,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            xy_block() 
                EVAFrontUpperBelt() 
                translate([0,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
            blue_motor_pulley() 
                translate([MotorPulleyDWB/2-BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            blue_rear_left_pulley()
                translate([XPulleySmoothDWB/2-BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
            blue_rear_right_pulley() 
                translate([0,-XPulleySmoothDWB/2+BeltThickness/2,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            blue_rear_left_pulley()
                translate([0,-XPulleySmoothDWB/2+BeltThickness/2,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
            blue_rear_right_pulley() 
                translate([-XPulleySmoothDWB/2+BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            blue_xaxis_pulley_from_rear()
                translate([-XPulleySmoothDWB/2+BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
                blue_xaxis_pulley_from_rear()
                translate([0,XPulleySmoothDWB/2-BeltThickness/2]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
                xy_block() EVABackUpperBelt() translate([0,0,0]) cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        }
    }
}




// Red belt location definitions

function red_motor_x() = -ExteriorWidth/2+11;


module red_motor_pulley(){
    translate([ 
        red_motor_x(),
        ExteriorDepth/2-MotorY/2-13,
        LowerBeltHeight]
    ) children();
}

module red_xaxis_pulley_from_motor(){
    translate([
        red_motor_x()+MotorPulleyDWB/2+XPulleySmoothDWB/2-BeltThickness,
        InteriorDepth/2-YLocation+XPulleySmoothDWB/2+EVAFrontBeltY-BeltThickness/2,
        LowerBeltHeight]
    )  children();
}

module red_rear_left_pulley(){
    translate([
        // R1: This value MUST be the same as R2
        -red_motor_x()-MotorPulleyDWB/2-XPulleySmoothDWB/2+BeltThickness,
        -ExteriorDepth/2+RearPulleyOffset*3.6,
        LowerBeltHeight]
    ) children();
}

module red_rear_right_pulley(){
    translate([
        red_motor_x(),
        -ExteriorDepth/2+RearPulleyOffset*2.5,
    LowerBeltHeight]
    ) children();
}

module red_xaxis_pulley_from_rear(){
    translate([
        // R2: This value MUST be the same as R1
        -red_motor_x()-MotorPulleyDWB/2-XPulleySmoothDWB/2+BeltThickness,
        InteriorDepth/2-YLocation-XPulleySmoothDWB/2+EVABackBeltY+BeltThickness/2,
        LowerBeltHeight]
    ) children(); 
}

module red_belt_path(BelthThickness=BeltThickness,BeltThickness=BeltThickness){
    // Create the red belt path 
    color("red"){
        hull(){
            red_motor_pulley() 
                translate([MotorPulleyDWB/2-BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            red_xaxis_pulley_from_motor() 
                translate([-XPulleySmoothDWB/2+BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
            red_xaxis_pulley_from_motor() 
                translate([0,-XPulleySmoothDWB/2+BeltThickness/2,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            xy_block() 
                EVAFrontLowerBelt() 
                translate([0,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
            red_motor_pulley() 
                translate([-MotorPulleyDWB/2+BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            red_rear_right_pulley()
                translate([-XPulleySmoothDWB/2+BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
            red_rear_right_pulley() 
                translate([0,-XPulleySmoothDWB/2+BeltThickness/2,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            red_rear_left_pulley()
                translate([0,-XPulleySmoothDWB/2+BeltThickness/2,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
            red_rear_left_pulley() 
                translate([XPulleySmoothDWB/2-BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
            red_xaxis_pulley_from_rear()
                translate([XPulleySmoothDWB/2-BeltThickness/2,0,0]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        };
        
        hull(){
                red_xaxis_pulley_from_rear()
                translate([0,XPulleySmoothDWB/2-BeltThickness/2]) 
                cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
            
                xy_block() EVABackLowerBelt() translate([0,0,0]) cylinder(r=BeltThickness/2,h=BeltHeight,center=true);
        }
    }
}



//difference(){
//translate([ExteriorWidth/2-80,0,XYCarriageHeight+4]) cube([80,4,20]);
//frame();
//}

module cable_mount(){
    //translate([-50,-ExteriorDepth/2-10-5,Height-50]) cube([100,5,50]);
    difference(){
        union(){ 
            translate([-30,-ExteriorDepth/2+10,Height-30]) cube([60,5,30]);    
            translate([-30,-ExteriorDepth/2+10,Height-5-30]) cube([60,45,5]);
                    
            
            translate([0,-ExteriorDepth/2+44,Height-35]) cylinder(r=13/2,h=4);

           
        }
  
        for(z=[-0:2:22]){
            translate([0,-ExteriorDepth/2+10,Height-z]) rotate([90,0,0])  cylinder(r=16/2,h=20,center=true);
        }
        for(x=[-2:1:2]){
            translate([-8-x,-ExteriorDepth/2+10,Height-22]) rotate([90,0,0])  cylinder(r=4.5/2,h=20,center=true);
            translate([8-x,-ExteriorDepth/2+10,Height-22]) rotate([90,0,0])  cylinder(r=4.5/2,h=20,center=true);

        }
        
        
        translate([0,-ExteriorDepth/2+44,Height-35-1]) cylinder(r=13.1/2,h=5);
        translate([0,-ExteriorDepth/2+44,Height-35-1]) cylinder(r=7/2,h=50);

        for(x=[-8,8]){
        translate([x,-ExteriorDepth/2+20,Height-35-1]) cylinder(r=5/2,h=50);
        }
        
        for(x=[-20,20]){
            translate([x,-ExteriorDepth/2+10,Height-10]) rotate([90,0,0])  cylinder(r=5.2/2,h=20,center=true);
        }
    }

}

//cable_mount();

module EVAFrontUpperBelt(){
    translate([EVAFrontUpperBeltX,EVAFrontBeltY,EVAFrontUpperBeltZ]) children();
}

module EVAFrontLowerBelt(){
    translate([EVAFrontLowerBeltX,EVAFrontBeltY,EVAFrontLowerBeltZ]) children();
}

module EVABackUpperBelt(){
    translate([EVABackUpperBeltX,EVABackBeltY,EVABackUpperBeltZ]) children();
}

module EVABackLowerBelt(){
    translate([EVABackLowerBeltX,EVABackBeltY,EVABackLowerBeltZ]) children();
}


module EVAHemeraCarriage(){
    rotate([0,0,180]){
        translate([0,0,-15.5]) {
            // The top mount must have it's bottom at Z=0 and centered in the X
            color("black") translate([0,0,15.5]) import("eva_hemera/top_mgn12.stl");
            color("lawngreen") translate([0,18.4,0]) import("eva_hemera/back_corexy.stl");
            color("lawngreen") translate([0,-13.4,0])import("eva_hemera/hemera_face.stl");
            color("black") translate([0,-13.5,-24.5]) import("eva_hemera/bottom_mgn12_hemera.stl");
            color("black") translate([-12,28.3,-15]) rotate([-90,0,180])  import("eva_hemera/tension_slider_9mm_belt_M5.stl");
            color("black") translate([12,28.6,-2.5]) rotate([90,0,0])  import("eva_hemera/tension_slider_9mm_belt_M5.stl");
        }
    }
}

module nema17(){
    translate([0,0,19]) rotate([0,180,0])  import("Motor_NEMA17.stl");
}


module nema17_cutout(){
    translate([0,0,48/2+2]) cube([42.4,42.4,48],center=true);
    cylinder(r=23/2,h=20,center=true);
    for(d=[-0.75:0.1:0.75]){
        for(x=[-1,1]){
            for(y=[-1,1]){
                translate([x*(31/2+d),y*(31/2+d),0]) cylinder(r=3.2/2,h=20,center=true);
            }
        }
    }
}


module mgn12_x_rail(length=400,block=400/2){
    color("darkgrey") translate([0,0,4]) cube([length,12,8],center=true);
    color("#666666") translate([InteriorWidth/2-XLocation,0,10/2+3]) cube([45.4,27,10],center=true);
}

module mgn12_x_block(length=400,block=400/2){
    translate([InteriorWidth/2-XLocation,0,13]) children();
}


module mgn12_y_rail(length=400,block=400/2){
    color("darkgrey") translate([0,0,4]) cube([12,length,8],center=true);
    color("#666666") translate([0,InteriorDepth/2-YLocation,10/2+3]) cube([27,45.4,10],center=true);
    

}

module mgn12_y_block(length=400,block=400/2) {
    translate([0,InteriorDepth/2-YLocation,13]) children();
}



OUTPUT="";
if (OUTPUT=="") {
    frame();
    blue_motor_mount();
    red_motor_mount();
    xy_carriage_mount_lower_cf_tube();
    xy_carriage_mount_upper_cf_tube();
    mirror([1,0,0]) xy_carriage_mount_lower_cf_tube();
    mirror([1,0,0]) xy_carriage_mount_upper_cf_tube();
    rear_left_pulley_mount();
    rear_right_pulley_mount();
    y_endstop_mount();
    y_endstop();
    
    x_endstop_mount();
    x_endstop();
} else {
    $fn=50;

    if (OUTPUT=="left_motor_mount"){
        blue_motor_mount();
    } else if (OUTPUT=="right_motor_mount") {
        red_motor_mount();
    } else if (OUTPUT=="left_xy_carriage_mount_lower_cf_tube") {
        xy_carriage_mount_lower_cf_tube();
    } else if (OUTPUT=="left_xy_carriage_mount_upper_cf_tube"){
        xy_carriage_mount_upper_cf_tube();
    } else if (OUTPUT=="left_xy_carriage_mount_lower_al_2020") {
        xy_carriage_mount_lower_al_2020();
    } else if (OUTPUT=="left_xy_carriage_mount_upper_al_2020"){
        xy_carriage_mount_upper_al_2020();
    } else if (OUTPUT=="right_xy_carriage_mount_lower_cf_tube") {
        mirror([1,0,0]) xy_carriage_mount_lower_cf_tube();
    } else if (OUTPUT=="right_xy_carriage_mount_upper_cf_tube"){
        mirror([1,0,0]) xy_carriage_mount_upper_cf_tube();
    } else if (OUTPUT=="right_xy_carriage_mount_lower_al_2020") {
        mirror([1,0,0]) xy_carriage_mount_lower_al_2020();
    } else if (OUTPUT=="right_xy_carriage_mount_upper_al_2020"){
        mirror([1,0,0]) xy_carriage_mount_upper_al_2020();
    } else if (OUTPUT=="rear_left_pulley_mount"){
        rear_left_pulley_mount();
    } else if (OUTPUT=="rear_right_pulley_mount"){
        rear_right_pulley_mount();
    } else if (OUTPUT=="y_endstop_mount"){
        y_endstop_mount();
    } else if (OUTPUT=="x_endstop_rail_mount"){
        x_endstop_rail_mount();
    } else if (OUTPUT=="x_endstop_sensor_mount"){
        x_endstop_sensor_mount();
    } else if (OUTPUT=="xy_carriage_mount_cf_tube_upper_drill_jig"){
        xy_carriage_mount_cf_tube_upper_drill_jig();
    } else if (OUTPUT=="ft5"){
        frame();
        blue_motor_mount();
        red_motor_mount();
        xy_carriage_mount_lower_cf_tube();
        xy_carriage_mount_upper_cf_tube();
        mirror([1,0,0]) xy_carriage_mount_lower_cf_tube();
        mirror([1,0,0]) xy_carriage_mount_upper_cf_tube();
        rear_left_pulley_mount();
        rear_right_pulley_mount();
        y_endstop_mount();
        x_endstop_mount();
    }

}


AcrylicCoverThickness=3;
/*
projection(){
rotate([90,0,0]){
//front_top_cover();
front_lower_cover();
}
}*/

/*
front_top_cover();
front_lower_cover();
side_top_cover();
back_top_cover();
side_lower_cover();
mirror([1,0,0]){
    side_top_cover();
    side_lower_cover();
}
top_cover();
back_lower_cover();

module side_top_cover(){
    width=ExteriorDepth-10;
    height=Height-XYCarriageHeight-10-10;
    translate([ExteriorWidth/2+10+AcrylicCoverThickness/2+5,0,Height-(height)/2-15]) 
        %cube([AcrylicCoverThickness,width,height],center=true);
    echo("Side cover top",width,height);
}

module cover_exhaust_cutout(cut=true){
    for(x=[-105/2,105/2]){
        for(y=[-105/2,105/2]){
            translate([x,0,y]) rotate([90,0,0]) cylinder(r=4.1/2,h=1000);
        }
    }
    rotate([90,0,0]) cylinder(r=119/2,h=1000);

}

module side_lower_cover(){
    width=ExteriorDepth-10;
    height=XYCarriageHeight-10-10;
     
    %difference(){
        translate([ExteriorWidth/2+10+AcrylicCoverThickness/2+5,0,XYCarriageHeight/2+5]) cube([AcrylicCoverThickness,width,height],center=true);
        
        translate([0,-ExteriorDepth/2+EnclosureDepth/2-15,20+7+EnclosureHeight/2]) cube([EnclosureWidth+200,EnclosureDepth,EnclosureHeight],center=true);

    }
    echo("Side lower cover",width,height);
}

module front_lower_cover(){
    width=ExteriorWidth-10;
    height=XYCarriageHeight-10-10;
    translate([0,ExteriorDepth/2+10+AcrylicCoverThickness/2+5,XYCarriageHeight/2+5]) 
    %difference(){  
            cube([width,AcrylicCoverThickness,height],center=true);
            cube([1,1000,3000],center=true);
            for(x=[20,width-20]){
                for(z=[60,height/2,height-60]){
                    for(xh=[-10,10]){
                        for(zh=[-10,10]){
                        translate([x-width/2+xh,0,z-height/2+zh]) rotate([90,0,0]) 
                            cylinder(r=3.4/2,h=10000,center=true);
                        }
                    }
                }
            }
    }
    echo("Front lower cover",width,height);
}

module back_lower_cover(){
    //FIXME this is wrong some how
    width=ExteriorWidth-10;
    height=XYCarriageHeight-EnclosureHeight-32;
    %translate([0,-ExteriorDepth/2-10-AcrylicCoverThickness/2-5,Height-EnclosureHeight-(height)/2-20]) difference() {
        cube([width,AcrylicCoverThickness,height],center=true);
        
    }
    echo("Back top cover",width,height);
}

module back_top_cover(){
    //FIXME this is wrong some how
    width=ExteriorWidth-10;
    height=Height-XYCarriageHeight-10-10;
    %translate([0,-ExteriorDepth/2-10-AcrylicCoverThickness/2-5,Height-(height)/2-15]) difference(){
        cube([width,AcrylicCoverThickness,height],center=true);
        cover_exhaust_cutout();
    }
    echo("Back top cover",width,height);
}

module front_top_cover(){
    //FIXME this is wrong some how
    width=ExteriorWidth-10;
    height=Height-XYCarriageHeight-10-10;
    translate([0,ExteriorDepth/2+10+AcrylicCoverThickness/2+5,Height-(height)/2-15]) 
    %difference(){
        cube([width,AcrylicCoverThickness,height],center=true);
          cube([1,1000,3000],center=true);
            for(x=[20,width-20]){
                for(z=[height/2]){
                    for(xh=[-10,10]){
                        for(zh=[-10,10]){
                        translate([x-width/2+xh,0,z-height/2+zh]) rotate([90,0,0]) 
                            cylinder(r=3.4/2,h=10000,center=true);
                        }
                    }
                }
            }
    }
    echo("Front top cover",width,height);
}

module top_cover(){
    %difference(){
        translate([0,0,Height+AcrylicCoverThickness+5]) cube([ExteriorWidth,ExteriorDepth,AcrylicCoverThickness],center=true);  

        //Cut a fairly large hole for cabling and bowden tube
        translate([0,BedCenterY,0]){
            cylinder(r=120/2,h=10000,center=true);
            for(x=[-105/2,105/2]){
                for(y=[-105/2,105/2]){
                    translate([x,y,0]) cylinder(r=4/2,h=10000);
                }
            }
        }
    }
}
*/

//cube([300,300,532]);
