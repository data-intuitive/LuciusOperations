#!/bin/bash

set -e

## VIASH START
par_endpoint="http://127.0.0.1:8090"
par_classpath="com.dataintuitive.luciusprocessing"
par_conf="etc/processing.conf"
par_db="my_test_db"
par_db_version=10
par_application=luciusprocessing
par_cutoff="2022-12-01"
par_geneAnnotations=""
par_incremental=false
## VIASH END

tmpfile=`mktemp`
cp "$par_conf" "$tmpfile"

my_sed="sed -i'.original'"

$my_sed "s#__input__#$par_input#" "$tmpfile"
$my_sed "s#__db__#$par_db#" "$tmpfile"
$my_sed "s#__cutoff__#$par_cutoff#" "$tmpfile"
$my_sed "s#__incremental__#$par_incremental#" "$tmpfile"

echo ">> Effective config used:"
cat $tmpfile

echo ">> Run command"
curl -s --data-binary "@${tmpfile}" \
  "${par_endpoint}/jobs?context=${par_application}&appName=${par_application}&classPath=${par_classpath}.process"
