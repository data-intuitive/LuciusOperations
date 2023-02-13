#!/bin/bash

utils/load/workflow --run_id run1-a --output run1-a.json && \
  utils/load/workflow --run_id run1-b --output run1-b.json && \
  utils/load/workflow --run_id run1-c --output run1-c.json && \
  utils/load/workflow --run_id run1-d --output run1-d.json && \
  utils/load/workflow --run_id run1-e --output run1-e.json &

sleep .1

utils/load/workflow --run_id run2-a --output run2-a.json && \
  utils/load/workflow --run_id run2-b --output run2-b.json && \
  utils/load/workflow --run_id run2-c --output run2-c.json && \
  utils/load/workflow --run_id run2-d --output run2-d.json && \
  utils/load/workflow --run_id run2-e --output run2-e.json &

sleep .1

utils/load/workflow --run_id run3-a --output run3-a.json && \
  utils/load/workflow --run_id run3-b --output run3-b.json && \
  utils/load/workflow --run_id run3-c --output run3-c.json && \
  utils/load/workflow --run_id run3-d --output run3-d.json && \
  utils/load/workflow --run_id run3-e --output run3-e.json &

sleep .1

utils/load/workflow --run_id run4-a --output run4-a.json && \
  utils/load/workflow --run_id run4-b --output run4-b.json && \
  utils/load/workflow --run_id run4-c --output run4-c.json && \
  utils/load/workflow --run_id run4-d --output run4-d.json && \
  utils/load/workflow --run_id run4-e --output run4-e.json &

sleep .1

utils/load/workflow --run_id run5-a --output run5-a.json && \
  utils/load/workflow --run_id run5-b --output run5-b.json && \
  utils/load/workflow --run_id run5-c --output run5-c.json && \
  utils/load/workflow --run_id run5-d --output run5-d.json && \
  utils/load/workflow --run_id run5-e --output run5-e.json &

