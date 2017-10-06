# How to setup and use OSC automation

## Need Python 3, and Python libraries for Robot framework and OpenStack usage:

Install Python 3.X  

### In order to run automation from Windows:

python -m pip install --upgrade pip

http://landinghub.visualstudio.com/visual-cpp-build-tools  
Download Visual C++ 2015 Build Tools  

1. pip install python-openstackclient  
2. pip install python-keystoneClient  
3. pip install python-neutronclient  
4. pip install robotframework  

At the end please run the command:   
  5. pip install -I python-openstackclient

### In order to run automation from Ubuntu:

1. sudo apt-get update  
2. sudo apt-get install python-setuptools build-essential  
3. sudo apt-get install python-openstackclient  
4. sudo apt-get install python-keystoneClient  
5. sudo apt-get install python-neutronclient  
6. sudo pip3 install robotframework

At the end please run the command:  
7. sudo pip3 install -I python-openstackclient

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
