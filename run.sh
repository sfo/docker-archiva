#!/bin/sh

## with ideas from https://github.com/benjamin-heasly/archiva-docker/blob/master/run-archiva

# apply ARCHIVA_CONTEXT_PATH
sed -i "s|name=\"contextPath\">/<|name=\"contextPath\">$ARCHIVA_CONTEXT_PATH<|g" \
  "${ARCHIVA_HOME}/contexts/archiva.xml"

# create directories if not exist
for i in "logs" "data" "temp"
do
	mkdir -p "${ARCHIVA_BASE}/${i}"
done

# copy initial config file if not exist
if [ ! -d "${ARCHIVA_BASE}/conf" ]
then
	cp -r "${ARCHIVA_HOME}/conf" "${ARCHIVA_BASE}/"
fi

# start archiva
${ARCHIVA_HOME}/bin/archiva console
