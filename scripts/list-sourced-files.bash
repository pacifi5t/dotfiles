#!/bin/bash
bash -lixc exit 2>&1 | sed -nE 's/^\+* (source|\.) //p'
