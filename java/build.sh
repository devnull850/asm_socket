#!/bin/bash

BUILD=build/classes
SRC=src/main/java/server

javac -d $BUILD $SRC/HttpServerTest.java $SRC/SimpleHttpHandler.java
