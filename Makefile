all: left_motor_mount right_motor_mount left_xy_carriage_mount_lower right_xy_carriage_mount_upper \
	left_xy_carriage_mount_upper right_xy_carriage_mount_upper rear_left_pulley_mount rear_right_pulley_mount \
	y_endstop_mount ft5

OPENSCAD=openscad

OUTPUT:=$(addprefix output/, $(addsuffix .stl, ($PARTS)))


left_motor_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

right_motor_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

left_xy_carriage_mount_lower: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

right_xy_carriage_mount_lower: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

left_xy_carriage_mount_upper: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

right_xy_carriage_mount_upper: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

rear_left_pulley_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

rear_right_pulley_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

y_endstop_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

ft5: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad



