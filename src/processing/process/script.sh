#!/bin/bash

## VIASH START
par_endpoint="http://127.0.0.1:8090"
par_classpath="com.dataintuitive.luciusprocessing"
par_conf="etc/processing.conf"
par_db="my_test_db"
par_db_version=10
par_application=luciusprocessing
par_input="/Users/toni/Dropbox/_GSK/2022/newdata"
par_cutoff="2022-12-01"
par_geneAnnotations=""
par_incremental=false
## VIASH END

tmpfile=`mktemp`

cp "$par_conf" "$tmpfile"

gsed -i "s#__input__#$par_input#" "$tmpfile"
gsed -i "s#__db__#$par_db#" "$tmpfile"
gsed -i "s#__cutoff__#$par_cutoff#" "$tmpfile"
gsed -i "s#__incremental__#$par_incremental#" "$tmpfile"

curl -s --data-binary "@${tmpfile}" \
  "${par_endpoint}/jobs?context=${par_application}&appName=${par_application}&classPath=${par_classpath}.process"
