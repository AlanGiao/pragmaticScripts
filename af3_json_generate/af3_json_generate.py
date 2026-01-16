"""Generate JSON file for AlphaFold3 job submission."""

import os
from pathlib import Path
import glob
import argparse
import json
from typing import List
from pprint import pprint

def parse_args():
    parser = argparse.ArgumentParser(description='Generate JSON file for AF3 job submission.')
    parser.add_argument("root_dir", help="Directory that stores all folders that store FASTA sequences.The Structrure of the directory must be: RootDir/ProteinName/{seq1,seq2,...}.fasta. You can run `python spam abc` and explore the directory hierachy of the `example` to get a clue.")
    parser.add_argument("out_name", help="Output filename of JSON")
    args = parser.parse_args()
    return args

def parse_a_complex(seq_files: List):
    """Parse all sequences of a single protein complex.
    
    @param seq_file A list of fasta files.
    @return A Dict of the struct of JSON file of AlphaFold 3. 
        See https://github.com/google-deepmind/alphafold/blob/main/server/README.md
    """
    name_field = Path(seq_files[0]).parent.name
    model_seeds_field = []
    sequences_field = []
    
    sequences = map(_get_sequence, seq_files)
    for sequence in sequences:
        sequences_element = {
            "proteinChain": {
                "sequence": sequence,
                "count": 1
            }
        }
        sequences_field.append(sequences_element)
    
    return {
        "name": name_field,
        "modelSeeds": model_seeds_field,
        "sequences": sequences_field
    }
        
    
def _get_sequence(seq_file) -> str:
    seq = ''
    with open(seq_file, 'r') as f:
        for line in f:
            if line.startswith('>'):
                continue
            seq += line.strip()
    return seq


def main(args):
    protein_complexes = []
    for sub_dir in glob.glob(f"{args.root_dir}/*"):
        if not os.path.isdir(sub_dir):
            continue
        else:
            print(f"Processing sequences in folder: {sub_dir}")
            seq_files = glob.glob(f"{sub_dir}/*.fasta")
            print(f"  Files to be processed: {', '.join(seq_files)}")
            parsed_complex = parse_a_complex(seq_files)
            protein_complexes.append(parsed_complex)
    with open(f"{args.out_name}.json", "w") as f:
        f.write(json.dumps(protein_complexes, indent=2))
    print(f"JSON written to: {args.out_name}.")
            

if __name__ == "__main__":
    args = parse_args()
    main(args)
    