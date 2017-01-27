#!/bin/bash
export POM_UPDATE_PARENT_FILE=${POM_UPDATE_PARENT_FILE:-"pom.xml"}
python -c "import xml.etree.ElementTree as ET; \
	ET.register_namespace('','http://maven.apache.org/POM/4.0.0'); \
	tree=ET.parse(open('$POM_UPDATE_PARENT_VERSION')); \
	tree.getroot().find('{http://maven.apache.org/POM/4.0.0}parent').find('{http://maven.apache.org/POM/4.0.0}version').text='$POM_UPDATE_PARENT'; \
	tree.write('$POM_UPDATE_PARENT_FILE/pom.xml')"

