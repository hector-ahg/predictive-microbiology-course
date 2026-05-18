# Predictive Microbiology Workshop: From Microbiomes to Predictive Models in Research

This repository contains materials for a hands-on workshop in predictive microbiology. The course introduces the analysis of microbiome data and the development of predictive models using Python. Topics include 16S rRNA amplicon sequencing analysis, functional inference, and machine learning applied to inflammatory bowel disease (IBD) and related research questions.

---

## Important Note

This repository is intended as a **read-only master template** for the workshop.

It provides the canonical structure, notebooks, and pipelines that students will use as a reference while working. During the course, participants will execute and modify these materials in their own environments (primarily Google Colab), where they will work on independent copies of the notebooks.

Changes made by students in Colab do not affect this repository, ensuring a stable and consistent reference version for all users.

---

## Course Content

The workshop is organized into the following modules:

1. **Introduction to Python for Predictive Microbiology**  
   Basic programming concepts, functions, and data handling in Python.

2. **Microbiome Analysis with QIIME 2 and PICRUSt2**  
   Processing of 16S rRNA sequencing data and functional prediction.

3. **Data Integration and Exploration in Python**  
   Structuring and analyzing microbiome-derived datasets.

4. **Machine Learning for Disease Prediction**  
   Application of supervised learning methods to inflammatory bowel disease datasets.

5. **Project Clinic**  
   Guided development of participant projects and feedback sessions.

---

## Repository Structure

- `dataset/` – Manifests and Metadata of IBDMDB HMP2 dataset
- `docs/` – Course Program and Slides
- `notebooks/` – Main course notebooks (Colab-ready)
- `pipeline/` – Reference QIIME 2 and PICRUSt2 workflows in bash


---

## Data Availability

All datasets (raw sequencing data) are downloaded from external sources. Full pipeline output from QIIME2 and PICRUST2 are hosted externally to keep this repository lightweight and fast to clone. 

---

## Usage

The course consists of multiple NUMBERED Jupyter Notebooks in Google Colab (recommended environment). We will go through them in the following order:

0. Introduction to Python  

   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/hector-ahg/predictive-microbiology-course/blob/main/notebooks/00_intro_to_python.ipynb)

1. Python Data Analysis with Pandas and Matplotlib  

   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/hector-ahg/predictive-microbiology-course/blob/main/notebooks/01_python_data_analysis_with_pandas_and_matplotlib.ipynb)


2. Inference of taxonomic composition and fucntions in QIIME2 and PICRUST2 in Colab

   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/hector-ahg/predictive-microbiology-course/blob/main/notebooks/02_qiime2_picrust2_in_colab.ipynb)

3. Exploratory microbiome analysis
   
   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/hector-ahg/predictive-microbiology-course/blob/main/notebooks/03_exploratory_microbiome_analysis.ipynb)

4. Microbiome-meta data integration and multivarate analysis

   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/hector-ahg/predictive-microbiology-course/blob/main/notebooks/04_microbiome_metadata_integration_and_multivariate_analysis.ipynb)

Alternatively, you can clone the repository locally:
   ```bash
   git clone https://github.com/hector-ahg/predictive-microbiology-course.git