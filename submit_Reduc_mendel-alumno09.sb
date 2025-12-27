#!/bin/bash
#
# ================================================================= 
# Laboratorio 5: Python en Paralelo  
# 3.3. multiprocessing y Numba avanzado
# Reducción: suma de elementos de un array
# =================================================================
#
#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno09/lab-py-advan
#SBATCH -J reduc-array
#SBATCH --cpus-per-task=8
#SBATCH --output=reduc-%j.out

# Cargar módulo
module load anaconda/2025.06

# Leer parámetros
value=$1
ncores=$2

# Configurar variables de entorno para threads
export NUMBA_NUM_THREADS=$ncores
export OMP_NUM_THREADS=$ncores

echo "========================================"
echo "Ejecutando reduc-operation-array-par-alumno09.ipynb"
echo "VALUE=$value | NCORES=$ncores"
echo "========================================"

# Ejecutar notebook
ipython reduc-operation-array-par-alumno09.ipynb $value $ncores

# Limpiar entorno
module unload anaconda/2025.06
