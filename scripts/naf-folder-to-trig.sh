#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT="$( cd $DIR && cd .. && pwd)"
LIB="$ROOT"/lib

RESOURCES="$( cd $ROOT && cd .. && pwd)"/vua-resources
# assumes vua-resources is installed next to this installation
# git clone https://github.com/cltl/vua-resources.git
#
# the software assume that the input files are in NAF format minially with the following layers:
# - tokens, terms, entities, coreference for events, srl, timeExpressions
# to create an event coreference layer, use the event-coreference scripts

java -Xmx2000m -cp "$LIB/EventCoreference-v3.1.2-jar-with-dependencies.jar" eu.newsreader.eventcoreference.naf.GetSemFromNafFolder --naf-folder $1 --extension ".naf" --non-entities --project wikinews --all --ili "$RESOURCES/ili.ttl.gz" --perspective --eurovoc-en "$RESOURCES/mapping_eurovoc_skos.label.concept.gz" --source-frames "$RESOURCES/source.txt"
