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

- `notebooks/` – Main course notebooks (Colab-ready)
- `pipeline/` – Reference QIIME 2 and PICRUSt2 workflows
- `scripts/` – Helper functions and utilities
- `data_links.md` – External dataset download links (Zenodo / cloud storage)

---

## Data Availability

All large datasets (raw sequencing data and full pipeline outputs) are hosted externally to keep this repository lightweight and fast to clone.

See: `data_links.md`

---

## Usage

The course consists of multiple NUMBERED Jupyter Notebooks in Google Colab. We will go through them in the following order:

1. Introduction to Python:  
   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/hector-ahg/predictive-microbiology-course/blob/main/notebooks/00_intro_to_python.ipynb)


2. Python data analysis with Pandas and Matplotlib:  
   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com//github.com/hector-ahg/predictive-microbiology-course/blob/main/notebooks/01_python_data_analysis_with_pandas_and_matplotlib.ipynb)

Work through the NUMBERED NOTEBOOKS sequentially in Colab (recommended environment). Alternatively, you can clone the repository locally:
   ```bash
   git clone https://github.com/hector-ahg/predictive-microbiology-course.git