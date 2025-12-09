#!../../bin/linux-x86_64/ort_994

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change ort_994 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/db")
epicsEnvSet ("PORT_ORTEC", "serial_ort")
#epicsEnvSet ("HW_DEVICE", "ortec")

## Register all support components
dbLoadDatabase "dbd/ort_994.dbd"
ort_994_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure($(PORT_ORTEC), "100.100.0.5:4002")
#asynOctetSetInputEos($(PORT_ORTEC),0,"\n\r")
asynOctetSetInputEos($(PORT_ORTEC),0,"\n")
#asynOctetSetOutputEos($(PORT_ORTEC),0,"\n\r")
asynOctetSetOutputEos($(PORT_ORTEC),0,"\n")

asynSetTraceMask($(PORT_ORTEC),-1,0x9);
asynSetTraceIOMask($(PORT_ORTEC),-1,0x2)

### Load record instances
##DEV_SEL=ortec_1
##dbLoadRecords("db/ort_994.db","user=xlabsrv2")
##dbLoadRecords("db/ort_994.db", "ASYNPORT=$(PORT_ORTEC)")

#dbLoadRecords("db/ort_994.db", "ASYNPORT=$(PORT_ORTEC), DETECT=ortec_1")
dbLoadTemplate("db/ort_994.val")

##dbLoadRecords("db/ort_994.db", "DETEC=$(DEV_SEL)")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=xlabsrv2"
