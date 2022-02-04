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
InteriorWidth = 420;

InteriorDepth = 482;

// Center of XY Carriage height
XYCarriageHeight = 525;

// Total Length of the 2020 extrusion for the X axis
X2020Length = 500;

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

BedX = 325;
BedY = 325;

////////////////////////////////////////// XY Carriage center on the bed /////////////////////////
// Change this to simulate movement
X = 160;  //(-150 to 150)
Y = 160;  //(-150 to 150)


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

    // Draw the bed in to give some idea of where the extruder needs to travel
    translate([0,BedCenterY,XYCarriageHeight-40]) color("lightgrey"){
        cube([BedX,BedY,2],center=true);
        translate([0,0,20]) cube([300,300,2],center=true);

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
}


module rear_left_pulley_mount(){
    difference(){
        union(){
            //25mm bolt
            //blue_rear_left_pulley() translate([0,0,-5]) cylinder(r=5.1/2,h=30,center=true);
           translate([0,0,-CornerPH/2-5/2-CornerPulleyMountSpacer]) union(){
                hull(){
                    red_rear_left_pulley() cylinder(r=CornerPDWN/2+10/2,h=5,center=true);
                    translate([ExteriorWidth/2-2.5,-ExteriorDepth/2+2.5,LowerBeltHeight])cube([25,25,5],center=true);
                }
                translate([ExteriorWidth/2-15,-ExteriorDepth/2-10,LowerBeltHeight])
                    cube([25,25,UpperBeltHeight-LowerBeltHeight+15+2*CornerPulleyMountSpacer]);
           }
           
           translate([0,0,UpperBeltHeight-LowerBeltHeight+CornerPH/2+5/2+CornerPulleyMountSpacer]) union(){
                hull(){
                    red_rear_left_pulley() cylinder(r=CornerPDWN/2+10/2,h=5,center=true);
                    translate([ExteriorWidth/2-2.5,-ExteriorDepth/2+2.5,LowerBeltHeight])cube([25,25,5],center=true);
                }    
            }
           
        }
        
        
        
        blue_rear_left_pulley() cylinder(r=5.0/2,h=100,center=true);
        red_rear_left_pulley() cylinder(r=5.0/2,h=100,center=true);
       
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

module x_endstop_mount(){
    x_endstop_placement() {
        difference(){
            union(){
                cube([3,18,42]);
                translate([0,15,0]) cube([16,3,42]);

                translate([16.3-3.5,22,40.6-3.5]) rotate([90,0,0]) cylinder(r=7/2,h=5);
                translate([16.3-3.5,22,40.6-3.5-19]) rotate([90,0,0]) cylinder(r=7/2,h=5);
            }
            translate([16.3-3.5,22,40.6-3.5]) rotate([90,0,0]) cylinder(r=2.9/2,h=150,center=true);
            translate([16.3-3.5,22,40.6-3.5-19]) rotate([90,0,0]) cylinder(r=2.9/2,h=150,center=true);
            for (z=[-3:1:3]){
                translate([10,7,10+z]) rotate([0,90,0]) cylinder(r=4.1/2,h=100,center=true);
            }
        }
    }
}

module x_endstop(){
    x_endstop_placement() translate([0,22,0])   rotate([0,270,270]) import("models/MakerBot_Endstop.stl");
}



module y_endstop(){
    //https://www.thingiverse.com/thing:2405504/files
    y_endstop_placement() translate([0,0,11]) import("models/MakerBot_Endstop.stl");
}

module y_endstop_placement(){
    translate([-ExteriorWidth/2-10,-ExteriorDepth/2+60,XYCarriageHeight+Extrusion2020Height/2]) children();
}

module y_endstop_mount(){
    y_endstop_placement() {
        difference(){
            union(){
                cube([40.6,30,3]);
                  
                translate([40.6-3.5,16.3-3.5,0]){
                    cylinder(r=7/2,h=11);
                }
   

                translate([40.6-3.5-19,16.3-3.5,0]){
                    cylinder(r=7/2,h=11);
                }
            }
            
            translate([10,25,0]) difference(){
                cylinder(r=5.2/2,h=20,center=true);
            }
             
            translate([40.6-3.5,16.3-3.5,0]){
                cylinder(r=2.9/2,h=11);
            }
   

            translate([40.6-3.5-19,16.3-3.5,0]){
                cylinder(r=2.9/2,h=11);
            }

        }
    
     
       // translate([0,0,12]) endstop();
    }
}



module xy_carriage_mount_upper(){
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
            blue_xaxis_pulley_from_motor() cylinder(r=5.3/2,h=100,center=true);
            red_xaxis_pulley_from_rear() cylinder(r=5.3/2,h=100,center=true);
            
        
            blue_xaxis_pulley_from_motor() translate([0,0,XYCarriageHeight-UpperBeltHeight+MGN12Height+Extrusion2020Height/2+Extrusion2020Height+XCarriageMountHeight+5]) translate([-2,-8,-0.5]) linear_extrude(1) text("F",size=5,valign="center");
            
            
            translate([InteriorWidth/2+33,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);
            translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_block() cylinder(r=5.1/2,h=100,center=true);

        }
       
    }
  
}

module xy_carriage_mount_lower(){
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
            blue_xaxis_pulley_from_motor() cylinder(r=5.3/2,h=100,center=true);
            red_xaxis_pulley_from_rear() cylinder(r=5.3/2,h=100,center=true);
            
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
    xy_carriage_mount_lower();
    xy_carriage_mount_upper();
    mirror([1,0,0]) xy_carriage_mount_lower();
    mirror([1,0,0]) xy_carriage_mount_upper();
    rear_left_pulley_mount();
    rear_right_pulley_mount();
    y_endstop_mount();
    y_endstop();
} else {
    $fn=50;

    if (OUTPUT=="left_motor_mount"){
        blue_motor_mount();
    } else if (OUTPUT=="right_motor_mount") {
        red_motor_mount();
    } else if (OUTPUT=="left_xy_carriage_mount_lower") {
        xy_carriage_mount_lower();
    } else if (OUTPUT=="left_xy_carriage_mount_upper"){
        xy_carriage_mount_upper();
    } else if (OUTPUT=="right_xy_carriage_mount_lower") {
        mirror([1,0,0]) xy_carriage_mount_lower();
    } else if (OUTPUT=="right_xy_carriage_mount_upper"){
        mirror([1,0,0]) xy_carriage_mount_upper();
    } else if (OUTPUT=="rear_left_pulley_mount"){
        rear_left_pulley_mount();
    } else if (OUTPUT=="rear_right_pulley_mount"){
        rear_right_pulley_mount();
    } else if (OUTPUT=="y_endstop_mount"){
        y_endstop_mount();
    } else if (OUTPUT=="ft5"){
        frame();
        blue_motor_mount();
        red_motor_mount();
        xy_carriage_mount_lower();
        xy_carriage_mount_upper();
        mirror([1,0,0]) xy_carriage_mount_lower();
        mirror([1,0,0]) xy_carriage_mount_upper();
        rear_left_pulley_mount();
        rear_right_pulley_mount();
        y_endstop_mount();
        //y_endstop();
    }

}





