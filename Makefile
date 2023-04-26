all: left_motor_mount right_motor_mount left_xy_carriage_mount_lower_cf_tube right_xy_carriage_mount_upper_cf_tube left_xy_carriage_mount_upper_cf_tube right_xy_carriage_mount_upper_cf_tube left_xy_carriage_mount_lower_al_2020 right_xy_carriage_mount_upper_al_2020 left_xy_carriage_mount_upper_al_2020 right_xy_carriage_mount_upper_al_2020 rear_left_pulley_mount rear_right_pulley_mount y_endstop_mount ft5 x_endstop_sensor_mount x_endstop_rail_mount xy_carriage_mount_cf_tube_upper_drill_jig

OPENSCAD=openscad

OUTPUT:=$(addprefix output/, $(addsuffix .stl, ($PARTS)))

clean:
	rm -rf stls/*.stl

left_motor_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

right_motor_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

left_xy_carriage_mount_lower_cf_tube: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

right_xy_carriage_mount_lower_cf_tube: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

left_xy_carriage_mount_upper_cf_tube: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

right_xy_carriage_mount_upper_cf_tube: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

left_xy_carriage_mount_lower_al_2020: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

right_xy_carriage_mount_lower_al_2020: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

left_xy_carriage_mount_upper_al_2020: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

right_xy_carriage_mount_upper_al_2020: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

rear_left_pulley_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

rear_right_pulley_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

y_endstop_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

x_endstop_rail_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

x_endstop_sensor_mount: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad

xy_carriage_mount_cf_tube_upper_drill_jig:  ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad


ft5: ft5.scad
	${OPENSCAD} -DOUTPUT=\"$(basename $@)\" -o stls/$@.stl ft5.scad



