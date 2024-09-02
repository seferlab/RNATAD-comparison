# A Comparative Analysis of Topological Domain Callers over RNA Associated Interactomes

## Prepare RNA Interactome data (scripts are in the prepare_data folder)

### Prepare the RNA Interactome data for Section 3.1

**step 1.**    Download merged sequencing reads from RNA experiments

	./download_raw_data.sh
	
**step 2.**    Down-sample reads

	./downsample.sh

### Prepare the RNA Interactome data for Section 3.2 and 3.3

**step 1.**    Download raw files

	./download_raw_hic.sh
	
**step 2.**    Generate KR normalized matrices using Juicertools 

	./dump_data_from_hic.sh

The synthetic data used in this manuscript is deposited at work/simulate_data folder and work/benchmarks.

## Call TADs (scripts are in the work folder)

The preprocessed data for Section 3.1 could be deposited at work/GM12878_downsample_diff_reso folder.

The preprocessed data for Section 3.2 and 3.3 could be deposited at work/Rao folder.
Directories structure in work/Rao folder

---Rao/

------HIC001/

------HIC002/

------...

Bash scripts in the folder of each TAD caller (such as work/Armatus) shall call TADs from the Hi-C data. The executive file path or command statement should be updated according to your actual situation. It will spend a lot of time for some methods to call TADs, such as TADtree. 
