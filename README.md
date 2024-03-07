
# Quasar-EAGS (Quasar ETMS-Adapted Generated Server)
This project is based on CERNs Quick opcUA Server generAtion fRamework. 
It contains modified CMAKE Files, config files, instructions and other good-to-know information for the ATLAS team, specifically for the **ITk-ETMS Project (Enviromental Temperature Monitoring System**).
# How to create a server from scratch (UA Server for v1.8+, Almalinux 9.3)
1. Before anything, we need to download and install the needed dependencies for Quasar to run. So, head over to your linux machine and run:
```bash
sudo dnf install git patch python3-colorama python3-jinja2 python3-lxml cmake3 gcc-c++ boost-devel graphviz ninja-build xsd xerces-c-devel libxml2-devel openssl-devel doxygen astyle
```
2. After all of it is downloaded, create an account in the [Unified Automation website](https://www.unified-automation.com/). Make sure your team has a license, but if they don't, there is a trial version you can download from [this link](https://www.unified-automation.com/downloads/opc-ua-development/c-client-server-pubsub/c-based-opc-ua-client-server-pub-sub-sdk-linux-64bit.html)

3. Once you have downloaded the SDK, you'll want to clone the repository. You can do so by running this command in your terminal:
```bash
git clone --recursive https://github.com/Grupo-de-Investigacion-ATLAS-PUJ/Atlas-Configured-Quasar
```
4. Once is downloaded, copy the SDK from UA, place it in the root of the folder (So, where the quasar.py file is located) and run 
```bash
 ./quasar.py set_build_config CustomETMSConfig.cmake
 ```
5. And finally run
```bash
./quasar.py build
```
If you get a WrongReturnValue: tool cmake returned 1, try running it with sudo.


---------------------------------------------------------------------------------------------------------------------
The project website is [quasar.docs.cern.ch](https://quasar.docs.cern.ch/), where you can obtain more information.

NOTE: Clone quasar with the _--recursive_ flag. Required since quasar uses source code from other git repositories (specifically: [LogIt](https://github.com/quasar-team/LogIt) is a [git submodule](https://git-scm.com/docs/gitsubmodules))

