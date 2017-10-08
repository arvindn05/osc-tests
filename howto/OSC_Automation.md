# How to setup and use OSC automation
This document describes how to use public and private Python libraries and Robot framework in OSC team's test automation.

## Prerequisites  
1. Install Python 3.X  
2. Pull in github OSC private Python libraries
3. Install Robot framework

### Windows Environment
Ensure that your pip is at the latest version:
`> python -m pip install --upgrade pip`

Download Visual C++ build tools from http://landinghub.visualstudio.com/visual-cpp-build-tools to avoid following error when installing OpenStack libraries: "error Microsoft Visual C++ 14.0 is required. Get it with "Microsoft Visual C++ Build Tools".

```sh
`> pip install python-openstackclient`  
`> pip install python-keystoneClient`  
`> pip install python-neutronclient`  
`> pip install robotframework`  
```
The following are examples of executing Robot with Python commands on Windows:

`> cd  osc-tests\functional-tests\robot`  

Single test suite:   
`> c:\Python36\Scripts\pybot.bat -d ..\results -v testbed:mytestbed.robot MC.robot`  

Multiple test suites:   
`> c:\Python36\Scripts\pybot.bat -d ..\results -v testbed:mytestbed.robot -A Multiple-Suites.robot`  

### Ubuntu Environment
```sh
`$ sudo apt-get update`  
`$ sudo apt-get install python-setuptools build-essential`  
`$ sudo apt-get install python-openstackclient`  
`$ sudo apt-get install python-keystoneClient`  
`$ sudo apt-get install python-neutronclient`  
`$ sudo pip3 install robotframework`  
```
The following are examples of executing Robot with Python commands on Ubuntu:  
`$ cd  osc-tests/functional-tests/robot`   

Single test suite:  
`$ pybot -d ../results -v testbed:mytestbed.robot MC.robot`   

Multiple test suites:   
`$ pybot -d ../results -v testbed:mytestbed.robot -A Multiple-Suites.robot` 
