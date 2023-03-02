#!/bin/bash

file=$1
/bin/cp $file "$file`date +_%F:%T`.backup"
