#!/bin/bash
#
# ================================================================= 
# Laboratorio 5: Python en Paralelo  
# 3.4. Actividad extra - Paralelización de Monte Carlo Pi
# =================================================================
#
#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno09/lab-py-advan
#SBATCH -J pi
#SBATCH --cpus-per-task=8
#SBATCH --output=pi-%j.out

# Cargar módulo
module load anaconda/2025.06

# Leer parámetros
ntrials=$1
ncores=$2

# Solo configurar variables de entorno si se especifican cores
if [ -n "$ncores" ]; then
    export NUMBA_NUM_THREADS=$ncores
    export OMP_NUM_THREADS=$ncores
    echo "========================================"
    echo "Ejecutando pi-par-solution-alumno09.ipynb"
    echo "NTRIALS=$ntrials | NCORES=$ncores"
    echo "========================================"
    ipython pi-par-solution-alumno09.ipynb $ntrials $ncores
else
    echo "========================================"
    echo "Ejecutando pi-par-solution-alumno09.ipynb"
    echo "Modo interactivo (sin argumentos)"
    echo "========================================"
    ipython pi-par-solution-alumno09.ipynb
fi

# Limpiar entorno
module unload anaconda/2025.06
