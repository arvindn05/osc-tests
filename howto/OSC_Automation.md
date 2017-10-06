# How to setup and use OSC automation
This document describes how was ussing Python linbrary and Robot framework in OSC team's test automation.
## Need Python 3, and Python libraries for Robot framework and OpenStack usage:

Install Python 3.X  

### In order to run automation from Windows:

python -m pip install --upgrade pip

http://landinghub.visualstudio.com/visual-cpp-build-tools  
Download Visual C++ 2015 Build Tools  

pip install python-openstackclient  
pip install python-keystoneClient  
pip install python-neutronclient  
pip install robotframework  


### In order to run automation from Ubuntu:

sudo apt-get update  
sudo apt-get install python-setuptools build-essential  
sudo apt-get install python-openstackclient  
sudo apt-get install python-keystoneClient  
sudo apt-get install python-neutronclient  
sudo pip3 install robotframework  

## How to run Robot with Python:

### Examples how to run on windows:

cd  osc-tests\functional-tests\robot  

Single test suite:   
c:\Python36\Scripts\pybot.bat -d ..\results -v testbed:mytestbed.robot MC.robot

Multiple test suites:   
c:\Python36\Scripts\pybot.bat -d ..\results -v testbed:mytestbed.robot -A Multiple-Suites.robot

### Examples how to run on Ubuntu:
cd  osc-tests/functional-tests/robot

Single test suite:  
pybot -d ../results -v testbed:mytestbed.robot MC.robot

Multiple test suites:   
pybot -d ../results -v testbed:mytestbed.robot -A Multiple-Suites.robot

