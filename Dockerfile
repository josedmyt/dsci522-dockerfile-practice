FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-lock.yml conda-lock.yml 

RUN mamba update --quiet --file conda-lock.yml 
RUN mamba clean --all -y -f 
RUN fix-permissions "${CONDA_DIR}" 
RUN fix-permissions "/home/${NB_USER}"