#!/bin/bash

## VIASH START
par_endpoint="http://127.0.0.1:8090"
par_classpath="com.dataintuitive.luciusapi"
par_application="lucius"
par_conf="etc/api.conf"
par_db="my_test_db"
par_db_version=10
## VIASH END

tmpfile=`mktemp`

cp "$par_conf" "$tmpfile"

gsed -i "s#__db__#$par_db#" "$tmpfile"
gsed -i "s#__db_version__#$par_db_version#" "$tmpfile"
gsed -i "s#__geneAnnotations__#$par_geneAnnotations#" "$tmpfile"

echo ">> Effective config used:"
cat $tmpfile

echo ">> Run command"
curl -s --data-binary "@${tmpfile}" \
  "${par_endpoint}/jobs?context=${par_application}&appName=${par_application}&classPath=${par_classpath}.initialize"
