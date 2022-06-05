; Script based on an original created by tjjfvi (https://github.com/tjjfvi)
; Customized by @git-commit (https://github.com/git-commit/3d-printing)
; An up-to-date version of the tjjfvi's original script can be found
; here:  https://csi.t6.fyi/
; Note - This script will only work in Cura V4.2 and above!
; --- Global Settings
; layer_height = {layer_height}
; machine_nozzle_size = {machine_nozzle_size}
; smooth_spiralized_contours = {smooth_spiralized_contours}
; magic_mesh_surface_mode = {magic_mesh_surface_mode}
; machine_extruder_count = {machine_extruder_count}
; --- Single Extruder Settings
; speed_z_hop = {speed_z_hop}
; retraction_amount = {retraction_amount}
; retraction_hop = {retraction_hop}
; retraction_hop_enabled = {retraction_hop_enabled}
; retraction_enable = {retraction_enable}
; retraction_speed = {retraction_speed}
; retraction_retract_speed = {retraction_retract_speed}
; retraction_prime_speed = {retraction_prime_speed}
; speed_travel = {speed_travel}

;Setup temperatures
M140 S{material_bed_temperature} ;Set a new target heated bed temperature and continue without waiting. Use M190 to wait for the bed to reach the target temperature
M105 ;report temperature

;Move Z up and home
G1 Z15.0 F3000 ;Move Z Axis up
G28 X Y ; Home the X and Y axes

;Wait for Bed Temperature
M190 S{material_bed_temperature}

G28 ; Home
G29 ; ABL

M104 S{material_print_temperature} ; Heat me up baby

G1 Z15.0 F3000 ; Move Z Axis up
G28 X Y ; Home the X and Y axes ; Wait with printhead at x y home

M109 S{material_print_temperature} ; Heat me up baby

; Prime Time
G1 X5 Y10 Z0.2 F3000 ; get ready to prime
G92 E0 ; reset extrusion distance
G1 X160 E15 F600 ; prime nozzle
G1 X180 F5000 ; quick wipe

M201 X500.00 Y500.00 Z100.00 E5000.00 ;Setup machine max acceleration
M203 X500.00 Y500.00 Z10.00 E50.00 ;Setup machine max feedrate
M204 P500.00 R1000.00 T500.00 ;Setup Print/Retract/Travel acceleration
M205 X8.00 Y8.00 Z0.40 E5.00 ;Setup Jerk
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate

G92 E0 ;Reset Extruder
G1 Z2.0 F3000 ;Move Z Axis up