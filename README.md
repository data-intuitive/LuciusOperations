# LuciusOperations

> The glue that holds the Compass stack together

## Introduction

This repo is a toolbox for the maintenance of the Lucius stack. The main goal is to make life easier initializing/running/checking the APIs that are part of the stack: [LuciusAPI] and [LuciusProcessing]. We might add functionality for Sourire (and perhaps even Brutus) later as well.

[LuciusAPI] and [LuciusProcessing] are two REST APIs that are both endpoints defined using the Spark-Jobserver project and that expose complementary functionality:

### LuciusProcessing

[LuciusProcessing] deals with preparing source data into a format that can be initialized for [LuciusAPI].

[LuciusProcessing] only exposes 2 endpoints: a `process` endpoint for processing the data from input to [LuciusAPI]-ready output and a `check` endpoint for retrieving information about source and (pre-computed) output.

### LuciusAPI

[LuciusAPI] is the engine for the [LuciusWeb](https://github.com/data-intuitive/LuciusWeb) web frontend. It defines endpoints for all the queries and computations that need to be performed in the application. A Spark context is running 24x7 and [LuciusAPI] acts as the interface to that Spark context.

[LuciusAPI] contains many more endpoints for every kind of query of computation that needs to be available to the frontend. The concrete implementation of these endpoints is provided by the [LuciusCore] library: Zhang correlation calculation, histogram, ...

## CLI management using LuciusOperations

Connecting to those APIs is not hard: in principle one sends a configuration _object_ to the API and one gets a JSON object back. It does requires a very strict format for input and parameters and is cumbersome to write though.

In order to aid in connecting to the APIs and as such also perform basic processing and initialization tasks, we developed the LuciusOperations toolbox.

## Installation

The short version is to fetch the LuciusOperations repository, make sure you have Java 8 or higher installed and run `bin/build.sh`. After this, the tools for [LuciusProcessing] and [LuciusAPI] are respectively under `utils/processing` and `utils/api`:

```sh
git clone https://github.com/data-intuitive/LuciusOperations
cd LuciusOperations
bin/build.sh
```

The following _tools_ will be created:

```
utils
├── api
│   ├── check
│   ├── create_context
│   ├── fetch_jar
│   ├── initialize
│   ├── remove_context
│   └── upload_jar
└── processing
    ├── check
    ├── create_context
    ├── fetch_jar
    ├── process
    ├── remove_context
    └── upload_jar
    ```

Every tool in the toolbox is a (Viash) standalone script that contains it's own help, i.e.:

```
❯ utils/processing/check -h
check dev

Arguments:
--endpoint
type: string
default: http://localhost:8090
The endpoint (URL) to connect to

...
```

Please refer to the [installation](installation.qmd) instructions for more information about what is happening behind the scenes.

## Usage

A typical workflow would look like this:

0. Ensure the spark-jobserver is running

1. Make sure the JAR files for [LuciusAPI] and [LuciusProcessing] are available in a local directory, preferably one next to the other. Those JAR files are typically built using a CI pipeline, but can be fetched from the github repository as well.

2. Update the `_viash.yaml` configuration file for your environment.

3. run `bin/build.sh` again, as this will build the different tools with the correct defaults as provided in the `_viash.yaml` config file.

4. Run the following commands:

    ```
    utils/processing/upload_jar        # Upload both JAR files
    utils/api/upload_jar               
    utils/processing/create_context    # create the context
    utils/processing/process           # start the processing job
    utils/processing/check             # verify if output is written
    utils/api/initialize               # initialize Spark job
    utils/api/check                    # after some time, check
    ```

## Prerequisites

The following are required in order to run the components from the toolbox:

- `wget`
- `bash`
- `curl`

One day, we might allow `HTTPie` to be used for a more user friendly way of calling the endpoints.

[LuciusAPI]: https://github.com/data-intuitive/LuciusAPI
[LuciusWeb]: https://github.com/data-intuitive/LuciusWeb
[LuciusProcessing]: https://github.com/data-intuitive/LuciusProcessing
[LuciusOperations]: https://github.com/data-intuitive/LuciusOperations
