#!/bin/bash
#
# Train a CRF model on the NCBI Disease Corpus and evaluate it against the NCBI Disease Corpus test set
#

# extract the version from the MODEL_VERSIONS file - this is used as part of the file name for the serialized model file
export VERSION=$(grep "CHEMICAL.NLMCHEM" /home/dev/MODEL_VERSIONS | cut -f 2 -d "=")

# replace the VERSION placeholder in the properties template file to create the properties file used by train.sh
envsubst < /home/dev/scripts/properties/nlm-chem.properties.template > /home/dev/scripts/properties/nlm-chem.properties

# train the model - model will be written to /home/dev/crf-models/ncbidisease-ner-model.ser.gz
/home/dev/scripts/train.sh

# evaluate the model on the test set and write results (the standard error output stream) to file
/home/dev/scripts/test.sh 2> /home/dev/crf-performance/nlmchem.out 

# generate the JSON snippet that contains the evaluation metrics
/home/dev/scripts/crf-performance-to-json.sh chemical NLM_CHEM /home/dev/crf-performance/nlmchem.out > /home/dev/crf-performance/nlmchem.json
# TODO: generate JSON for comparison against CRAFT Chebi
