
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Final_Project_My_Height -dir "C:/ProySisDigAva/Final_Project_My_Height/planAhead_run_1" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/ProySisDigAva/Final_Project_My_Height/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/ProySisDigAva/Final_Project_My_Height} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Top.ucf" [current_fileset -constrset]
add_files [list {Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
