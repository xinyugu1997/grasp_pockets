# GRASP pocket clustering

[`grasp_cluster_pockets_with_residues.ipynb`](grasp_cluster_pockets_with_residues.ipynb) groups high-scoring protein atoms into predicted pockets using the GRASP score stored in each PDB atom's B-factor column. It reports the residue IDs belonging to each retained pocket.

Run the notebook from top to bottom, choose the settings in the control panel, and click **Run clustering**. In Google Colab, the first cells install the dependencies and prompt you to upload `site_metrics.py` and the scored PDB.

## Common knobs

- **Scored PDB**: input PDB containing per-atom GRASP scores in the B-factor column.
- **Clustering method**: selects one of the methods described below and displays its relevant controls.
- **GRASP score cutoff**: only atoms with a score above this value are considered. A higher cutoff selects fewer, more confident atoms; a lower cutoff includes more atoms.
- **Minimum atoms**: discards a pocket if it contains fewer than this number of selected atoms.
- **Pocket ranking**:
  - **Mean atom score** favors pockets with a high average confidence.
  - **Sum of scores** favors larger pockets with more total score.
  - **Sum of squared scores** gives extra weight to very high-scoring atoms.
- **Output prefix**: filename, optionally including a folder, used for the output CSV files.

## Clustering methods

### Mean Shift

Finds dense groups of selected atoms without requiring a predefined number of pockets.

- **Estimate bandwidth automatically**: uses the selected atoms to choose the grouping scale.
- **Bandwidth quantile**: controls automatic bandwidth estimation. Larger values usually produce a larger bandwidth and fewer, broader pockets.
- **Manual bandwidth (Å)**: used when automatic estimation is disabled. A larger bandwidth merges nearby groups; a smaller bandwidth creates more local groups.

### DBSCAN

Builds pockets from locally dense groups and labels isolated atoms as noise.

- **Neighbor radius ε (Å)**: maximum neighbor distance. Increasing it connects more atoms and tends to merge pockets.
- **Minimum neighbors**: number of nearby atoms required to form a dense region. Increasing it removes sparse groups but may discard small pockets.

### Louvain communities

Builds a distance graph between atoms and divides that graph into communities.

- **Graph cutoff (Å)**: maximum distance for connecting two atoms. A larger cutoff creates more connections and may merge nearby regions.
- **Louvain resolution**: controls community size. Higher values generally produce more, smaller communities; lower values produce fewer, larger communities.

### Single linkage

Merges groups when any pair of atoms between them is sufficiently close. It can connect pockets through chains of nearby atoms.

- **Linkage distance (Å)**: maximum merge distance. Increasing it produces fewer, larger pockets.

### Complete linkage

Merges groups only when their most distant atoms remain within the distance criterion. It tends to produce compact pockets.

- **Linkage distance (Å)**: maximum merge distance. Increasing it produces fewer, larger pockets.

### Average linkage

Uses the average distance between atoms in two groups. It provides a compromise between single and complete linkage.

- **Linkage distance (Å)**: maximum average merge distance. Increasing it produces fewer, larger pockets.

### Ward linkage

Groups atoms by minimizing variation in their thresholded GRASP scores while using a 5 Å spatial-connectivity graph from `site_metrics.py`.

- **Linkage distance**: stopping threshold in the Ward feature space. Increasing it generally produces fewer, larger pockets.

### Ground truth / ligand association

Assigns selected protein atoms to the nearest supplied ligand rather than discovering pockets without prior ligand information. This is mainly an evaluation or analysis method.

- **Ligand PDB**: PDB containing ligand coordinates. Each residue in this file is treated as a separate ligand group.
- **Association distance (Å)**: maximum distance from a selected protein atom to a ligand. Atoms farther away remain unassigned.

## Outputs

Each run creates:

- `<output_prefix>.csv`: one row per pocket, including its rank, score, atom count, residue count, and residue IDs.
- `<output_prefix>_residues.csv`: one row per pocket–residue association, including selected atom counts and residue-level GRASP statistics.

Pocket centers are not calculated or exported.
