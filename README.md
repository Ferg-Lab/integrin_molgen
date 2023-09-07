Hallucination of integrin activation pathways using nonlinear manifold learning and deep generative modeling
---

This repository demonstrates a general and transferrable approach to predict intermediate transition structures between known metastable states of large multi-molecular systems that are difficult to obtain using conventional techniques. The method comprises nonlinear manifold learning and deep generative modeling (DGM) methods to learn the forward mapping from high dimension (3D molecular structure) to low dimension (latent space) and a generative inverse mapping from low dimension (latent space) to high dimension (3D molecular structure), respectively. Density adaptive-diffusion maps and conditional Wasserstein generative adversarial networks (cWGAN) are used for nonlinear manifold learning and DGM, respectively. We use the prototypical and a major platelet integrin $\alpha_{IIb}-\beta_{3}$, a large transmembrane heterodimer protein to demonstrate the method. The generated structures enable potential understanding of the integrin activation mechanism and serve as potential seeds for additional calculations (e.g., string method) to map the free energy landscape. 

---

Installation

`INSTALL_LOCATION=<set path here for installation of conda env>`

`conda env create -f environment.yml --prefix $INSTALL_LOCATION` 

Note: [git lfs](https://git-lfs.com) is used for storing files in this repository. To download the intermediate all-atom PDB files, it may be better simply download the entire repository `download zip` link under `Code` option if `git lfs clone` or `git clone` doesn't work because of file size restrictions.

---

Main codes

- [https://github.com/Ferg-Lab/dMap_JAX](https://github.com/Ferg-Lab/dMap_JAX) is used for performing root mean square deviation (RMSD) calculations and to obtain diffusion maps (dMap). Both RMSD and dMap calculations are accelerated via [JAX](https://github.com/google/jax) library.
- DGM using cWGAN is performed using [https://github.com/Ferg-Lab/molgen.git](https://github.com/Ferg-Lab/molgen.git). 

<!--
<p align="center">
<img width="843" alt="Screenshot 2023-08-22 at 11 00 17 AM" src="https://github.com/Ferg-Lab/activeLearningPFASLinear/assets/38693318/083976aa-eb17-43b8-b232-90b9bfeb7218">
</p>
-->

---

Overview

1. [datasets](./datasets): Contains all-atom (~1770 residues) to 300 bead coarse-grained mapping of $\alpha_{IIb}-\beta_{3}$ integrin in each metastable state and learning of the unified low-dimensional embedding of the gross structure relations between and within metastable states using density-adaptive dMaps. Please see [datasets/README.md](./datasets/README.md) for getting started.
2. [model](./model): Trained cWGAN model to generate 300 bead coarse-grained structures of integrin using 4D latent space (leading four non-trivial dMap coordinates) as the conditional input. Please see [model/README.md](./model/README.md) for further details.
3. [inference](./inference): Access to notebooks to generate intermediate structure at latent space points corresponding to training samples and intermediate regions between metastable states for which no training samples are available. All-atom intermediate structures in PDB format between metastable states that are generated via targeted MD simulations are also available along with template GROMACS and PLUMED files. Please see [inference/README.md](./inference/README.md).
   
---

Cite

If you use the codes or notebooks from this repo in your work, please cite:

S. Dasetty, T. C. Bidone, G. A. Voth, and A. L. Ferguson. "Hallucination of integrin activation pathways using nonlinear manifold learning and deep generative modeling" XXXXX. DOI: XXXX

```
@article{ferglab2023PFAS,
  title={Hallucination of integrin activation pathways using nonlinear manifold learning and deep generative modeling},
  author={Dasetty, S. and Bidone, T.C. and Voth, G.A. and Ferguson, A.L.},
  journal={XXXX},
  volume={XXXX},
  number={XXXX},
  pages={XXXX-XXXX},
  year={2023},
  publisher={XXXX}
}
```



