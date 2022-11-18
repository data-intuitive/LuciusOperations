#!/bin/bash

## VIASH START
par_base="https://github.com/data-intuitive/LuciusAPI/releases/download"
par_tag=5.1.0
par_jar_prefix=LuciusAPI-assembly
par_target=jars
## VIASH END

JAR="${par_jar_prefix}-${par_tag}.jar"
URI="${par_base}/v${par_tag}/${JAR}"

mkdir -p "${par_target}"

wget "$URI" -O "${par_target}/${JAR}"
