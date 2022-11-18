# LuciusOperations

## Introduction

This repo is a toolbox for the maintenance of the Lucius stack. The main goal is to make life easier initializing/running/checking the APIs that are part of the stack: LuciusAPI and LuciusProcessing.

At the moment, the defaults are for a development environment running locally.

If spark-jobserver is running (see the `--endpoint` argument), this is the (current) sequence of working components:

```sh
target/native/api/fetch_jar/fetch_jar
target/native/api/create_context/create_context
target/native/api/upload_jar/upload_jar
target/native/api/initialize/initialize --conf etc/initialize.conf
```

To wrap up, the following can be used:

```sh
target/native/api/remove_context/remove_context
```

The tools should be configured for the environment out of the box, but if you find yourselve in a custom situation it's possible to override all the options. An overview of the arguments can be seen by adding `--help` or `-h` to the respective _tool_.

## Prerequisites

The following are required in order to run these components:

- `bash`
- `curl`

If you want to _build_ the components, you will need Java 8 or higher.

## Pre-releaes information

At the time of writing, the `target/` directory does not yet exist because we haven't _released_ a version of the tools yet. In order to get the `target` folder built, one can run:

```sh
bin/viash_build
```
