from pymol import cmd,stored

set depth_cue, 1
set fog_start, 0.4

set_color b_col, [36,36,85]
set_color t_col, [10,10,10]
set bg_rgb_bottom, b_col
set bg_rgb_top, t_col      
set bg_gradient

set  spec_power  =  200
set  spec_refl   =  0

load "data/6ty3.pdb", protein
create ligands, protein and organic
select xlig, protein and organic
delete xlig

hide everything, all

color white, elem c
color bluewhite, protein
#show_as cartoon, protein
show surface, protein
#set transparency, 0.15

show sticks, ligands
set stick_color, magenta






# SAS points

load "data/6ty3.pdb_points.pdb.gz", points
hide nonbonded, points
show nb_spheres, points
set sphere_scale, 0.2, points
cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)


stored.list=[]
cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
lastSTP=stored.list[-1] # get the index of the last residue
hide lines, resn STP

cmd.select("rest", "resn STP and resi 0")

for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))



set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [3937,3936,3060,3059,2896,3064,2903,2891,2887,2910,3425,3422,3833,3935,3932,3863,3931,3862,3057,3058,2924,3043,3447,3448,3423,2925,2923,3476,2884,2874,2871,2865,2872,2869,2867,2866,3465,3473,3441,3446] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [40,39,63,61,301,302,58,62,59,83,299,333,323,334,184,168,163,167,2709,322,170,324,169,2705,2703,2706,103,102] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [1543,1576,1547,1580,1585,1432,1434,1402,1579,1401,1445,1354,1578,1183,1355,1356,1362,1330,1328,1323,1177,1279,1181,1280,1277,1276,1389,1357,1358,1359,1222,1221] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [767,1862,1859,511,761,514,769,768,764,1813,1848,1007,1010,1009,1008,1046,1047,1829,985,946,795,1830,1812,984,418,754,755,978] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [1481,1484,1480,1543,1392,3364,1395,1483,1579,1401,1354,1362,1332,1330,1328,1358,1359] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [465,448,438,1009,735,418,737,738,50,717,736,74,755,1037,1002,137,1038,72] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [2506,2507,2562,786,520,541,540,399,277,542,2561,383,388,389,378,377,376] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [2462,2464,489,2483,2486,2484,509,1866,1875,492,1861,1862,511,1860,1879,1877,416] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [3398,3400,3397,3396,3067,3399,3065,3066,3071,3050,3051,2930,2839,2933,2934,2935] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [246,241,243,725,407,409,245,569,267,268,266,26,42,727] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [3178,3163,3167,3407,3169,3340,3386] 
set surface_color,  pcol11, surf_pocket11 




deselect

orient
