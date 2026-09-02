Install P2RANK(https://github.com/rdk/p2rank/blob/develop/documentation/user-guide.md#1-introduction) first

**make own prank pocket predictions (P2RANK)**

*-minimum ligandability score for SAS point be considered ligandable*

pred_point_threshold = 0.35


*-minimum cluster size (of ligandable points) for initial clustering*

pred_min_cluster_size = 3


*-clustering distance for ligandable clusters for second phase clustering*

pred_clustering_dist = 3


*-SAS points around ligandable points (an their score) will be included in the pocket*

extended_pocket_cutoff = 3.5


*-cutoff distance of protein surface atoms considered as part of the pocket*

pred_protein_surface_cutoff = 3.5

**example command line to run:**

prank predict -f 6ty3.pdb -c alphafold -pred_point_threshold 0.5 -o ./out
