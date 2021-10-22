#!/bin/bash

#SBATCH -c 1                                  # Request one core
#SBATCH -N 1                                  # Request one node

#SBATCH -t 0-12:00                            # Run time D-HH:MM format
#SBATCH -p short                              # Partition to run in
#SBATCH --mem=2000                            # Memory total in MB (in all cores)
#SBATCH -e /ERROR-LOCATION/hostname_%j.err    # File to which STDERR will be written, including jobID             # Change/Delete this
#SBATCH --mail-type=ALL                       # Type of email notification- BEGIN, END, FAIL, ALL
#SBATCH --mail-user=EMAIL@host.com            # Email where notifications send to                                 # Change/Delete this

# Loading required module
module load gcc/6.2.0
module load python

# Gnomad pull and reformat
# Run pull script. This pulls both clinvar and gnomad
python clinvar_pull.py

# Add in date
mv clinvar_GR37.vcf.gz clinvar_GR37_$(date +%F).vcf.gz
