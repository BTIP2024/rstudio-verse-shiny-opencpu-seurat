FROM docker.io/btip2024/rstudio-verse-shiny-opencpu:latest

RUN \
   apt-get update && \
   apt-get upgrade

RUN \
   apt-get install -y \
   libhdf5-dev \
#   libpng-dev \
#   libboost-all-dev \
#   openjdk-8-jdk \
#   python3-dev \
#   python3-pip \
   libfftw3-dev \
#   libgsl-dev \
   libglpk40 

# Install system library for rgeos
#RUN apt-get install -y libgeos-dev

# Install UMAP
#RUN LLVM_CONFIG=/usr/lib/llvm-10/bin/llvm-config pip3 install llvmlite
#RUN pip3 install numpy
#RUN pip3 install umap-learn

# Install FIt-SNE
#RUN git clone --branch v1.2.1 https://github.com/KlugerLab/FIt-SNE.git
#RUN g++ -std=c++11 -O3 FIt-SNE/src/sptree.cpp FIt-SNE/src/tsne.cpp FIt-SNE/src/nbodyfft.cpp  -o bin/fast_tsne -pthread -lfftw3 -lm

# Install bioconductor dependencies & suggests
# RUN R --no-echo --no-restore --no-save -e "install.packages('BiocManager')"
# RUN R --no-echo --no-restore --no-save -e "BiocManager::install(c('multtest', 'S4Vectors', 'SummarizedExperiment', 'SingleCellExperiment', 'MAST', 'DESeq2', 'BiocGenerics', 'GenomicRanges', 'IRanges', 'rtracklayer', 'monocle', 'Biobase', 'limma', 'glmGamPoi'))"

# Install CRAN suggests
#RUN R --no-echo --no-restore --no-save -e "install.packages(c('VGAM', 'R.utils', 'metap', 'Rfast2', 'ape', 'enrichR', 'mixtools'))"

# Install spatstat
#RUN R --no-echo --no-restore --no-save -e "install.packages(c('spatstat.explore', 'spatstat.geom'))"

# Install hdf5r
RUN R --no-echo --no-restore --no-save -e "install.packages('hdf5r')"

# Install latest Matrix
#RUN R --no-echo --no-restore --no-save -e "install.packages('Matrix')"

# Install rgeos
#RUN R --no-echo --no-restore --no-save -e "install.packages('rgeos')"

# Install Seurat
RUN R --no-echo --no-restore --no-save -e "install.packages('devtools')"
RUN R --no-echo --no-restore --no-save -e "install.packages('Seurat')"

# Install SeuratDisk
RUN R --no-echo --no-restore --no-save -e "devtools::install_github('mojaveazure/seurat-disk')"

# Install SeuratData
RUN R --no-echo --no-restore --no-save -e "devtools::install_github('satijalab/seurat-data')"

CMD ["\init"]