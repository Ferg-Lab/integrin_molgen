
Overview

1. [bent-int1](./bent-int1): Contains generated 300 CG bead structure using cWGAN and the corresponding predicted all-atom structure using targeted MD simulations between bent and int 1 state.
2. [bent-int2](./bent-int2): Contains generated 300 CG bead structure using cWGAN and the corresponding predicted all-atom structure using targeted MD simulations between bent and int 2 state.
3. [bent-open](./bent-open): Contains generated 300 CG bead structure using cWGAN and the corresponding predicted all-atom structure using targeted MD simulations between bent and open state. 
4. [int1-int2](./int1-int2): Contains generated 300 CG bead structure using cWGAN and the corresponding predicted all-atom structure using targeted MD simulations between int 1 and int 2 state. 
5. [int1-open](./int1-open): Contains generated 300 CG bead structure using cWGAN and the corresponding predicted all-atom structure using targeted MD simulations between int 1 and open state.
6. [int2-open](./int2-open): Contains generated 300 CG bead structure using cWGAN and the corresponding predicted all-atom structure using targeted MD simulations between int 2 and open state.
In 1-6, each folder contains subfolders named target_md_int1_0 to target_md_int1_9 and target_md_open_0 to target_md_open_9. target_md_int1_* contains all-atom structures generated using int 1 all atom structure as the initial structure in targeted MD simulations. Simularly, target_md_open_* contains all-atom structures generated using open all atom structure as the initial structure in targeted MD simulations. 0 to 9 refer to the ten structures generated between the states as shown in the paper.

NOTE: Because each file is ~2.5 MB, the data is uploaded using git lfs. To download the structures, it may be better to simply download the entire repository as a zip file.

Notebooks

[cg_300_integrated_training_integrin_dmap_decoder-generatePoints.ipynb](./cg_300_integrated_training_integrin_dmap_decoder-generatePoints.ipynb): Notebook to generate the ten latent space points between metastable states and generate the 300 bead CG structures using the trained cWGAN model.

[cg_300_integrated_training_integrin_dmap_decoder-generatePoints.ipynb](./cg_300_integrated_training_integrin_dmap_decoder-generatePoints.ipynb):  Notebook to generate 300 bead CG configurations at any given latent space point. In this notebook, the configurations are generated to generate potential structures along switchblade and deadbolt mechanism.


