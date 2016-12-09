#!/bin/sh

for i in "logs" "data" "temp"
do
	mkdir -p "${ARCHIVA_BASE}/${i}"
done

if [ ! -d "${ARCHIVA_BASE}/conf" ]
then
	cp -r "${ARCHIVA_HOME}/conf" "${ARCHIVA_BASE}/"
fi

${ARCHIVA_HOME}/bin/archiva console
