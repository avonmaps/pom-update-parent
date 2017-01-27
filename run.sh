#!/bin/bash
export WERCKER_POM_UPDATE_PARENT_POM=${WERCKER_POM_UPDATE_PARENT_POM:-"pom.xml"}
python -c "import xml.etree.ElementTree as ET; \
	ET.register_namespace('','http://maven.apache.org/POM/4.0.0'); \
	tree=ET.parse(open('$WERCKER_POM_UPDATE_PARENT_POM')); \
	tree.getroot().find('{http://maven.apache.org/POM/4.0.0}parent').find('{http://maven.apache.org/POM/4.0.0}version').text='$WERCKER_POM_UPDATE_PARENT_VERSION'; \
	tree.write('$WERCKER_POM_UPDATE_PARENT_POM')"

