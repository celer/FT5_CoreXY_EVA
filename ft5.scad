////////////////////////// Pulley definitions ///////////////////////////////////
// The pulley definitions define details about the pulleys which are critical to getting
// a precise corexy movement, the front belts MUST be parallel to their respective axis.

// The DWB = Diameter with belt - this the measurement of the diameter of the pulley
// with the belt on it. 

// Motor pully definitions
MotorPulleyH = 9;
MotorPulleyDWB = 12;

// X Axis Pulley details, I have accounted for the smooth pullyes seperately because
// they will have a different diameter than the toothed pulleys
XPulleySmoothH = 9;
XPulleySmoothDWB = 12;

// X Axis Pulley details, this can be toothed or smooth
XPulleyToothedH = 9;
XPulleyToothedDWB = 12;

// Rear left and right corner Pulley details
CornerPH = 9; // Height
CornerPDWN = 12; // Outside diameter with belt

//////////////////// FT5 Dimensions //////////////////////////////////////////////
//
// I've measured these somewhat accurately but thit's worth double checking.
//
// This is the distance between the centers of the exterior 2020 extrusions, measured 
// at center
ExteriorWidth = 520;
ExteriorDepth = 482;

// The inteior space of the XY carriage area
InteriorWidth = 401;
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
BeltThickness = 1.7;

// The height of the belt, in theory changing this to a wider belt should just work
BeltHeight = 6;

MotorX = 42.3;
MotorY = 42.3;

// Total height of an MGN12 rail and block 
MGN12Height = 13;

///////////////////////////////////////////// EVA Platform ////////////////////////////////
/// The EVA Carriage platform is meant to allow easy swapping of carriages so this is used
// by the ratrig guys to make it easy to support multiple extruders. 
// see https://main.eva-3d.page/

// Belt Offsets as calculated from the X block
EVAFrontBeltY = 15.5;

EVAFrontUpperBeltZ = -18;
EVAFrontLowerBeltZ = -30;

//How much to offset each pulley so that doesn't interfer with the others
RearPulleyOffset = 10;

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
X = -56;  //(-150 to 150)
Y = 30;  //(-150 to 150)


// Calculated location
YLocation = InteriorDepth/2 - BedCenterY+X;
XLocation = InteriorWidth/2 + Y;


// Calculated upper and lower belt heights
LowerBeltHeight = XYCarriageHeight + Extrusion2020Height/2 +
                MGN12Height + XCarriageMountHeight + Extrusion2020Height + MGN12Height + EVAFrontLowerBeltZ;

UpperBeltHeight = XYCarriageHeight + Extrusion2020Height/2 + 
                MGN12Height + XCarriageMountHeight + Extrusion2020Height + MGN12Height + EVAFrontUpperBeltZ;



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
    translate([-InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_rail();
    translate([InteriorWidth/2,0,XYCarriageHeight+10]) mgn12_y_rail();
    
    // X rail
    translate([0,0,XYCarriageHeight+10]) mgn12_y_block() translate([0,0,10+XCarriageMountHeight]) {
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
   
    red_motor_pulley() translate([0,0,10]) color("darkgrey") nema17();
    blue_motor_pulley() translate([0,0,10]) color("darkgrey") nema17();

    // Draw the bed in to give some idea of where the extruder needs to travel
    translate([0,BedCenterY,XYCarriageHeight-40]) color("lightgrey"){
        cube([BedX,BedY,2],center=true);
        translate([0,0,20]) cube([300,300,2],center=true);

    }
    
 
}

module rear_left_pulley_mount(){
    difference(){
        union(){
           translate([0,0,8]) union(){
                hull(){
                    red_rear_left_pulley() cylinder(r=CornerPDWN/2+10/2,h=5,center=true);
                    translate([ExteriorWidth/2,-ExteriorDepth/2,UpperBeltHeight])cube([30,30,5],center=true);
                }
                blue_rear_left_pulley() translate([0,0,-3]) cylinder(r=CornerPDWN/2+5/2,h=15);
                translate([ExteriorWidth/2,-ExteriorDepth/2,UpperBeltHeight-5])cube([30,30,10],center=true);
           }
           translate([0,0,-20]) union(){
                hull(){
                    red_rear_left_pulley() cylinder(r=CornerPDWN/2+10/2,h=5,center=true);
                    translate([ExteriorWidth/2,-ExteriorDepth/2,UpperBeltHeight])cube([30,30,5],center=true);
                }
                 red_rear_left_pulley() cylinder(r=CornerPDWN/2+5/2,h=15);
                 translate([ExteriorWidth/2,-ExteriorDepth/2,UpperBeltHeight+5])cube([30,30,10],center=true);

            }
        }
        red_belt_path(BeltThickness=3);
        blue_belt_path(BeltThickness=3);
        blue_rear_left_pulley() cylinder(r=5.1/2,h=100,center=true);
        red_rear_left_pulley() cylinder(r=5.1/2,h=100,center=true);


    }
}
//rear_left_pulley_mount();

module rear_right_pulley_mount(){
    difference(){
        union(){
           translate([0,0,-8]) union(){
                hull(){
                    blue_rear_right_pulley() cylinder(r=CornerPDWN/2+10/2,h=5,center=true);
                    translate([-ExteriorWidth/2,-ExteriorDepth/2,LowerBeltHeight])cube([30,30,5],center=true);
                }
                red_rear_right_pulley() translate([0,0,-12]) cylinder(r=CornerPDWN/2+5/2,h=15);
                translate([-ExteriorWidth/2,-ExteriorDepth/2,LowerBeltHeight+5])cube([30,30,10],center=true);
           }
           
           translate([0,0,20]) union(){
                hull(){
                    blue_rear_right_pulley() cylinder(r=CornerPDWN/2+10/2,h=5,center=true);
                    translate([-ExteriorWidth/2,-ExteriorDepth/2,LowerBeltHeight])cube([30,30,5],center=true);
                }
                 blue_rear_right_pulley() translate([0,0,-15]) cylinder(r=CornerPDWN/2+5/2,h=15);
                 translate([-ExteriorWidth/2,-ExteriorDepth/2,LowerBeltHeight-5])cube([30,30,10],center=true);

            }
        }
        red_belt_path(BeltThickness=3);
        blue_belt_path(BeltThickness=3);
        blue_rear_right_pulley() cylinder(r=5.1/2,h=100,center=true);
        red_rear_right_pulley() cylinder(r=5.1/2,h=100,center=true);
        
        translate([-ExteriorWidth/2,-ExteriorDepth/2,LowerBeltHeight-5]) rotate([90,0,0]) cylinder(r=5.1/2,h=30);
        translate([-ExteriorWidth/2-20,-ExteriorDepth/2,LowerBeltHeight-5]) rotate([0,90,0]) cylinder(r=5.1/2,h=30);
        
        translate([-ExteriorWidth/2,-ExteriorDepth/2,LowerBeltHeight+15]) rotate([90,0,0]) cylinder(r=5.1/2,h=30);
        translate([-ExteriorWidth/2-20,-ExteriorDepth/2,LowerBeltHeight+15]) rotate([0,90,0]) cylinder(r=5.1/2,h=30);
 
 
        

    }
}

//rear_right_pulley_mount();


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
    translate([blue_motor_x(),ExteriorDepth/2-MotorY/2-12,UpperBeltHeight]) children();
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
        -ExteriorDepth/2+RearPulleyOffset*4.5,
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
        ExteriorDepth/2-MotorY/2-12,
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
        -ExteriorDepth/2+RearPulleyOffset*4.5,
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

     frame();





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
    for(x=[-31/2,31/2]){
        for(y=[-31/2,31/2]){
            translate([x,y,0]) cylinder(r=3.1/2,h=20,center=true);
        }
    }
}


module mgn12_x_rail(length=400,block=400/2){
    color("darkgrey") translate([0,0,4]) cube([length,12,8],center=true);
    color("#666666") translate([InteriorWidth/2-XLocation,0,13/2+3]) cube([45.4,27,10],center=true);
}

module mgn12_x_block(length=400,block=400/2){
    translate([InteriorWidth/2-XLocation,0,13]) children();
}


module mgn12_y_rail(length=400,block=400/2){
    color("darkgrey") translate([0,0,4]) cube([12,length,8],center=true);
    color("#666666") translate([0,InteriorDepth/2-YLocation,13/2+3]) cube([27,45.4,10],center=true);
}

module mgn12_y_block(length=400,block=400/2) {
    translate([0,InteriorDepth/2-YLocation,13]) children();
}
