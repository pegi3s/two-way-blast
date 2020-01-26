# two-way-blast [![license](https://img.shields.io/badge/license-MIT-brightgreen)](https://github.com/pegi3s/two-way-blast) [![dockerhub](https://img.shields.io/badge/hub-docker-blue)](https://hub.docker.com/r/pegi3s/two-way-blast) [![compihub](https://img.shields.io/badge/hub-compi-blue)](https://www.sing-group.org/compihub/explore/5e2db6f9e1138700316488be)
> **two-way-blast** is a [compi](https://www.sing-group.org/compi/) pipeline to finding orthologs using a two-way BLAST approach. A Docker image is available for this pipeline in [this Docker Hub repository](https://hub.docker.com/r/pegi3s/two-way-blast).

## `two-way-blast` repositories

- [GitHub](https://github.com/pegi3s/two-way-blast)
- [DockerHub](https://hub.docker.com/r/pegi3s/two-way-blast)
- [CompiHub](https://www.sing-group.org/compihub/explore/5e2db6f9e1138700316488be)

# Using the `two-way-blast` pipeline in Linux

In order to use the `two-way-blast` pipeline, you should run and adapt the following command:

```bash
docker run --rm -v /path/to/input/data/dir:/input -v /path/to/output/data/dir:/output pegi3s/two-way-blast -q -- --reference_file <reference_nucleotide> --blast_type <blast_type>
```

In these command, you should replace:
- `/path/to/input/data/dir` to the actual path that contains your input FASTA files.
- `/path/to/output/data/dir` to the actual path where the output files will be created.
- `<reference_nucleotide>` to the actual name of your reference nucleotide file.
- `<blast_type>` to the name of the type of `BLAST` you want to use (either `blastn` or `tblastx`).

By default, this command launches the compi pipeline with the default number of parallel tasks (6). In order to launch the pipeline with more parallel tasks, add the `--num-tasks <num_tasks>` parameter right before the `--`.

# Test data

The sample data is available [here](https://github.com/pegi3s/two-way-blast/raw/master/resources/test-data-two-way-blast.zip). Download, uncompress it and move to the `test-data-two-way-blast` directory, where you will find:

- A directory called `data`, that contains the sample FASTA files.
- A file called `run.sh`, that contains the following commands (where you should adapt the paths) to test the pipeline:

```bash
INPUT_DIR=/path/to/test-data-two-way-blast/data/
OUTPUT_DIR=/path/to/output/data/dir
REFERENCE=nucleotide.fasta
BLAST_TYPE=tblastx
COMPI_NUM_TASKS=8

docker run --rm -v ${INPUT_DIR}:/input -v ${OUTPUT_DIR}:/output pegi3s/two-way-blast --num-tasks ${COMPI_NUM_TASKS} -q -- --reference_file ${REFERENCE} --blast_type ${BLAST_TYPE}
```

# Building the Docker image

To build the Docker image, [`compi-dk`](https://www.sing-group.org/compi/#downloads) is required. Once you have it installed, simply run `compi-dk build` from the project directory to build the Docker image. The image will be created with the name specified in the `compi.project` file (i.e. `pegi3s/two-way-blast:latest`). This file also specifies the version of compi that goes into the Docker image.
