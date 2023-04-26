/*
    Sorry this is quite a bit of a mess, and is carried over from a prior design
*/

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

module bl_touch_mount_holes(){
	translate([0,-38-9.2,-17]){
		for(x=[0,35.4]){
			translate([0,34,x]) rotate([0,90,0]) cylinder(r=3.5/2,h=100,center=true);
            translate([0,34,0]) rotate([0,90,0]) cylinder(r=6.1/2,h=49,center=true,$fn=6.05);
		}
	}
}

/*

translate([0,0,-38]) rotate([90,0,0]) {
translate([0,16,0]) color("black") cube([100,20,20],center=true);
                   color("red") translate([0,32,0]) cube([100,12,25],center=true);

}*/


module mount() {
    
    difference(){
        union(){
            translate([0,-21,-13]) cylinder(r=10/2,h=21);
            translate([0,0,-38]) rotate([90,0,0]) difference(){
                
                //Main block
                union(){
                    translate([0,1.5,-3.5+1]) cube([58,86+3,42+9],center=true);
                
                    
                    translate([0,1.5,-42/2]) difference(){
                        cube([56,86,7],center=true);
                    }
                }
                
                color("grey") lgx_screw_holes();

                fan_holes(2.5);
                
                // Screw holes for mounts
                for(x=[-25,25]){
                    for(y=[7,-69]){
                        translate([x,35+y,25]) cylinder(r=3.4/2,h=190,center=true);
                        translate([x,35+y,-65]) cylinder(r=6.05/2,h=90,center=true,$fn=6);
                    }
                }
                
                // Screw holes for cable mounts
                for(x=[-15,15]){
                    for(y=[7,-69]){
                        translate([x,35+y,-25]) cylinder(r=2.9/2,h=20,center=true);
                    }
                }
                translate([0,35+7-5,-25]) cylinder(r=2.9/2,h=20,center=true);

                
                // Cut out for the rail and slider
                translate([0,32,0]) cube([100,12,29],center=true);
                translate([0,05,0]) cube([100,53,22],center=true);


                // Cut out for the stepper motor
                translate([0,-23,0]) cube([42,50,43],center=true);
                
                // Cut out for rear stepper cables
                translate([0,-20,-12]) cube([26,64,19],center=true);
                
                // Cut out for rear stepper cables
                translate([0,-20,-22]) cube([15,64,19],center=true);
                
                // Cut out for front handle
                translate([0,-10,20]) cube([42,70,50],center=true);
                
                
                // Mounts for the stepper motor
                bl_touch_mount_holes();
                
                //Slide rail mounts
                for(x=[-10,10]){
                    for(z=[-10,10]){
                        translate([x,40,z]) rotate([90,0,0]) cylinder(r=3.3/2,h=20,center=true);
                    }
                }     
            }
 
           
            translate([EVABackUpperBeltX,-EVABackBeltY,EVABackUpperBeltZ]) translate([11,5.6,0]){
                cube([25,17,14],center=true); 
            }
            translate([EVABackLowerBeltX,-EVABackBeltY,EVABackLowerBeltZ]) translate([1,5.6,0]) {
                cube([25,17,14],center=true);
            }
        }
        
        translate([EVABackUpperBeltX,-EVABackBeltY,EVABackUpperBeltZ]) translate([10,5.6,0]){
            cube([25,14,12],center=true); 
            translate([0,2,0]) rotate([0,90,0]) cylinder(r=5.5/2,h=200,center=true);
        }
        translate([EVABackLowerBeltX,-EVABackBeltY,EVABackLowerBeltZ]) translate([2,5.6,0]) {
            cube([25,14,12],center=true);
            translate([0,2,0]) rotate([0,90,0]) cylinder(r=5.5/2,h=200,center=true);
        }
        
        // Front belt mounts
        translate([EVAFrontLowerBeltX-2.5,-EVAFrontBeltY,EVAFrontLowerBeltZ]) rotate([0,0,-90])  gt2_belt(); 
        
        translate([EVAFrontUpperBeltX+11.5,-EVAFrontBeltY-12,
        EVAFrontUpperBeltZ]) rotate([0,0,90]) gt2_belt();
        
       
      
        translate([EVAFrontLowerBeltX+1,-EVAFrontBeltY,EVAFrontLowerBeltZ]) {
            rotate([90,0,90]) for(z=[-7,7]){
                translate([-4,z,-5]) rotate([0,0,0]) cylinder(r=2.9/2,h=10,center=true);
            }
        }
        
        translate([EVAFrontUpperBeltX+8,-EVAFrontBeltY,EVAFrontUpperBeltZ]) rotate([90,0,90]) {
            
            for(z=[-7,7]){
                translate([-4,z,5]) cylinder(r=2.9/2,h=10,center=true);
            }
        }
        
        mirror([1,0,0]) rotate([90,0,0]) translate([0,-38,0]) fan();
   
     
        //filament tube hole
        translate([0,-21,-14]) cylinder(r=6/2,h=24);
        
        // front duct mount
        translate([0,-17,-76]) rotate([0,90,0]) cylinder(r=3.2/2,h=100,center=true);
        translate([0,-17,-76]) rotate([0,90,0]) cylinder(r=6.1/2,h=49,center=true,$fn=6.05);


    }
    

   
}


module mount_a(){
    intersection(){
        translate([0,-100,0]) cube([200,200,200],center=true);
        mount();
    }
}

module mount_b(){
    intersection(){
        translate([0,100,0]) cube([200,200,200],center=true);
        mount();
    }
}






module cable_mount(){
    translate([0,29,9]){
        difference(){
            union(){
                hull(){
                    translate([0,-10,15]) cylinder(r=22/2,h=27);
                    translate([0,0,28.5]) cube([20,4,27],center=true);
                }
                translate([0,0,11]) cube([20,4,62],center=true);
                translate([0,0,-13]) cube([40,4,14],center=true);

            }
            //translate([0,-13,25]) cylinder(r=16/2,h=50,center=true);
            translate([0,-10,25]) cylinder(r=16/2,h=50,center=true);

            for(z=[0:12:25]){
                translate([0,-17,22+z]) cube([24,24,4],center=true);
            }
            
            translate([0,-17,29]) cube([10,10,40],center=true);

            


        translate([0,0,-12]){
        for(z=[15,-15]){
            translate([z,0,0]) rotate([90,0,0]) cylinder(r=3.3/2,h=560,center=true);
        }   
        translate([0,0,-5]) rotate([90,0,0]) cylinder(r=3.3/2,h=560,center=true);

    }
    }
    }
}



module belt_mount(){
    difference(){
    union(){
      translate([EVAFrontLowerBeltX+1,-EVAFrontBeltY,EVAFrontLowerBeltZ]) translate([-6,-4.5,0]) cube([4,6,20],center=true);
    
    translate([EVAFrontLowerBeltX+1,-EVAFrontBeltY,EVAFrontLowerBeltZ]) translate([-6,-6.5,0]){
            rotate([90,0,90]) for(z=[-7,7]){
                translate([2.5,z,0])  cylinder(r=9/2,h=4,center=true);
            }
        }
    }
    
      translate([EVAFrontLowerBeltX+1,-EVAFrontBeltY,EVAFrontLowerBeltZ]) {
            rotate([90,0,90]) for(z=[-7,7]){
                translate([-4,z,-5]) rotate([0,0,0]) cylinder(r=3.2/2,h=10,center=true);
            }
      }    
    }
     
   /*    
    difference(){
            union(){
                translate([EVAFrontLowerBeltX-2 ,-EVAFrontBeltY-3,EVAFrontLowerBeltZ]) translate([0,-3.4,-3])  cube([6,6,6]);
                translate([EVAFrontLowerBeltX-2 ,-EVAFrontBeltY-3,EVAFrontLowerBeltZ]) translate([0,-4.9,-10])  cube([6,2,20]);
            }
            for(z=[-7,7]){
                %translate([EVAFrontLowerBeltX+1,-EVAFrontBeltY-3,EVAFrontLowerBeltZ+z]) rotate([0,0,0]) cylinder(r=2.9/2,h=1000,center=true);
            }
            translate([EVAFrontLowerBeltX-2,-EVAFrontBeltY+0.2,EVAFrontLowerBeltZ]) gt2_belt(); 
       }*/

        
        
}

module gt2_belt(len=12){
    translate([0,-1.55/2,-3.5]){
        cube([len,1.55-0.75,7]);
        for(r=[0:2:len]){
            translate([r,0,0]) cube([1.0,1.55,7]);
        }   
    }
}

module bl_touch_mount(){
	difference(){
        union(){
            translate([-31,-17.8+0.4,-41/2]){
                cube([2,14,42]);
                translate([-12,0,0]) cube([12,2,42]);
            }
            translate([-35,-17.8+0.4,2]) translate([-3,0,0]) for(z=[9,-9]){
                translate([0,0,z]) rotate([90,0,0])translate([0,0,-6]) cylinder(r=6/2,h=4);
            }
        }
		translate([-3,0,0]) bl_touch();

		for (z=[-2:0.25:3]){
			translate([0,z+3,0]) bl_touch_mount_holes();
		}
	}
}

module bl_touch(){
	translate([-35,-17.8+0.4,2]){ 
		rotate([90,0,0]) cylinder(r=3/2,45.7);
        rotate([90,0,0]) cylinder(r=8/2,36.3);

		rotate([90,0,0]) translate([0,0,-10]) cylinder(r=6/2,h=10);
		for(z=[9,-9]){
			translate([0,0,z]) rotate([90,0,0])translate([0,0,-10]) cylinder(r=3/2,h=10);
		}
	}
	
}

module lgx(){
	   translate([49,-50,-19]) import("models/LGX_Ace_Mosquito.stl");
}

module lgx_screw_holes(){
    translate([49,-50,-19])  {
            translate([0,19.75,26.25]) rotate([0,90,0]) cylinder(r=3.5/2,h=300,center=true);
            translate([0,19.75+17,26.25+11]) rotate([0,90,0]) cylinder(r=3.5/2,h=300,center=true);
    }
}



module airflow_exitfan(d=0){
     translate([5.25,-56,-40.25-3]) cube([20.5,10+d,15.5]);
}



nozzle_x=0;
nozzle_y=-60;
nozzle_z=18;

module airflow_exhaust(d=0,r=62,h=6){
    // translate([-20,-71+d,25]) rotate([0,-30,0]) cube([8,5,20]);
	translate([nozzle_x,nozzle_y,nozzle_z]) rotate([90,0,0]) translate([0,0,d]){ 
			cylinder(r=r/2,h=h,center=true,$fn=20);
	}
}



module airflow(){
        difference(){
            hull(){
                airflow_exitfan(); 
                airflow_exhaust();
            }
			
			airflow_exhaust(r=45,h=100);
			translate([nozzle_x,nozzle_y,nozzle_z+25]) cube([37,20,60],center=true);
					
        }   
}

module airflow_fins(){
	intersection(){
	intersection(){
		intersection(){
			union(){
				 for(x=[-24:6:26]){
					translate([x-2,-55,10]) cube([1.2,20,60],center=true);
				}
			}
			
			translate([0,0,10]) airflow();
			
		}
		translate([0,0,0]) airflow();
	}
	}
}


module duct(){
	
	//airflow_fins();
	
    difference(){
		union(){
		   
			translate([0,-21,-46])  difference(){
				union(){
					translate([4,-35.8,0]) cube([22.5,37,3]);
					cylinder(r=55/2,h=3);
					
					translate([20,20,0]) cylinder(r=12/2,h=3);
					translate([-21,-17,0]) cylinder(r=12/2,h=3);
					
					translate([0,-30,63]) difference(){
						cube([64,10,8],center=true);
						cube([50,10,8],center=true);

					}
					translate([0,-22,63]) difference(){
						cube([64,21,8],center=true);
						cube([58,21,8],center=true);
					}
				}
				cylinder(r=40/2,h=3);
				
			}
			
			
			difference(){
				minkowski(){
					airflow();
					cube([2,2,2],center=true);
				}
			}
			
		}
		fan_holes(4.5);
	
		
		airflow();	
		airflow_exitfan(2);
		
		
		// airflow_exhaust(5,r=52);
		difference(){
			airflow_exhaust(5,r=51);
			airflow_exhaust(5,r=41);
			translate([nozzle_x,nozzle_y,nozzle_z+25]) cube([37,20,60],center=true);
		}
         
        translate([0,-38,17]) rotate([0,90,0]) cylinder(r=3.2/2,h=100,center=true);

    }
}

module fan_holes(r=3.1){
    for(x=[-22,20.5]){
        for(y=[-19,19]){
            translate([x,y-20,-50]) cylinder(r=r/2,h=50);
        }
    }
}


module duct_mount(){
     translate([4,-56,-40.25]) cube([24,14,18]);
     translate([2,-49,-d/2+5]) cube([w,14,6],center=true);
}


module fan(){
    translate([25,-46,-43]) rotate([0,180,0]) import("models/5015_Blower_Fan.stl");
}
 
module tensioner(){
    translate([EVABackLowerBeltX+10,-EVABackBeltY+18,EVABackLowerBeltZ+6])  rotate([180,0,0]) import("rear_eva_9mm_tension_slider.stl");
}
//gt2_belt();


$fn=40;
//mirror([1,0,0]) mount_a();
//mirror([1,0,0]) duct();
//mirror([1,0,0]) mount_b();

//bl_touch_mount();
//belt_mount();

//front_belt_mount();
cable_mount();
//mount();


/*
$fn=40;
rotate([90,0,0]){
	//translate([0,-38,0]) duct();

	translate([0,-38,0]) color("black") fan();
	
	translate([0,-38,0]) color("grey") lgx();
    //translate([0,-38,0]) color("grey") lgx_screw_holes();
    
	translate([0,-41,0])  bl_touch_mount();
    translate([0,-41,0])  bl_touch();

}*/

/*
color("black"){
    
    translate([EVAFrontLowerBeltX-2-30,-EVAFrontBeltY,EVAFrontLowerBeltZ]) gt2_belt(len=40); 
    translate([EVAFrontUpperBeltX-2,-EVAFrontBeltY,EVAFrontUpperBeltZ]) gt2_belt(len=40); 
   
    translate([EVABackLowerBeltX,-EVABackBeltY,EVABackLowerBeltZ]) gt2_belt(len=40);
    translate([EVABackUpperBeltX-30,-EVABackBeltY,EVABackUpperBeltZ]) gt2_belt(len=40);  
}
    

 tensioner();*/
//mount();
//front_belt_mount();



