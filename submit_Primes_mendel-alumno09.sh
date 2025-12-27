#!/bin/bash
#
# ================================================================= 
# Laboratorio 5 :Python en Paralelo  
# 3.2. multiprocessing y Numba: Básico
# Suma de números primos
# =================================================================
#
#SBATCH -p hpc-bio-mendel
#SBATCH --chdir=/home/alumno09/lab-py-advan
#SBATCH -J primes
#SBATCH --cpus-per-task=8
#SBATCH --output=primes-%j.out

# Cargar módulo
module load anaconda/2025.06

# Leer parámetros
number=$1
ncores=$2

# Configurar variables de entorno para threads
export NUMBA_NUM_THREADS=$ncores
export OMP_NUM_THREADS=$ncores

echo "========================================"
echo "Ejecutando primes-par-alumno09.ipynb"
echo "NUMBER=$number | NCORES=$ncores"
echo "========================================"

# Ejecutar notebook
ipython primes-par-alumno09.ipynb $number $ncores

# Limpiar entorno (aunque no sería estrictamente necesario)
module unload anaconda/2025.06