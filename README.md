![Java CI workflow](https://github.com/UCDenver-ccp/translator-concept-recognition/workflows/Java%20CI/badge.svg)



# translator-concept-recognition
A repository dedicated to training and evaluating concept recognition pipelines and components that are used by the Text Mining Provider for the NCATS Biomedical Translator Program.



# Training a CRF on the CRAFT Corpus for a specific ontology

```
docker build -t craft-crf -f craft.crf.Dockerfile .
docker run --rm -v [LOCAL_MODEL_DIR]:/home/dev/crf-models -v [LOCAL_EVAL_DIR]:/home/dev/crf-performance craft-crf [ONT]
```

where,
* [ONT] is the ontology to use for training and is one of `chebi`,`cl`,`go_cc`,`go_bp`,`go_mf`,`mop`,`ncbitaxon`,`pr`,`so`,`uberon`
* [LOCAL_MODEL_DIR] is a directory on the host machine where the CRF model will be written
* [LOCAL_EVAL_DIR] is a directory on the host machine where the evaluation metrics for the trained model against the test set will be written


# Training a CRF on the NCBI Disease Corpus

```
docker build -t ncbi-disease-crf -f ncbi-disease.crf.Dockerfile .
docker run --rm -v [LOCAL_MODEL_DIR]:/home/dev/crf-models -v [LOCAL_EVAL_DIR]:/home/dev/crf-performance ncbi-disease-crf
```

where,
* [LOCAL_MODEL_DIR] is a directory on the host machine where the CRF model will be written
* [LOCAL_EVAL_DIR] is a directory on the host machine where the evaluation metrics for the trained model against the test set will be written


# Training a CRF on the Lobo et al HPO Corpus

```
docker build -t hpo-crf -f human-phenotype.crf.Dockerfile .
docker run --rm -v [LOCAL_MODEL_DIR]:/home/dev/crf-models -v [LOCAL_EVAL_DIR]:/home/dev/crf-performance hpo-crf
```

where,
* [LOCAL_MODEL_DIR] is a directory on the host machine where the CRF model will be written
* [LOCAL_EVAL_DIR] is a directory on the host machine where the evaluation metrics for the trained model against the test set will be written
