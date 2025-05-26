# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ort_994
# ort_994.dbd will be created and installed
DBD += ort_994.dbd

# ort_994.dbd will be made up from these files:
ort_994_DBD += base.dbd

# Include dbd files from all support applications:
#ort_994_DBD += xxx.dbd
ort_994_DBD += stream-base.dbd
ort_994_DBD += drvAsynIPPort.dbd
ort_994_DBD += asyn.dbd

# Add all the support libraries needed by this IOC
#ort_994_LIBS += xxx
ort_994_LIBS += stream
ort_994_LIBS += asyn

# ort_994_registerRecordDeviceDriver.cpp derives from ort_994.dbd
ort_994_SRCS += ort_994_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ort_994_SRCS_DEFAULT += ort_994Main.cpp
ort_994_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ort_994_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ort_994_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

