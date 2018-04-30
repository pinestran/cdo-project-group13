# REQUIREMENTS
+ Python 3.6.2
+ Pip (default with python)

# SET UP ENVIRONMENT IN FIRST
### NOTES
    Please sure that you in directory : `cdo-project-group13/source/coins/` before exec command below.

### CREATE VIRTUAL ENVIRONMENT
    `virtualenv venv`

### ACTIVATE
#### Linux
    `source venv/Sripts/activate`
#### Windows
    `.\venv\Sripts\activate`

### INSTALL PACKAGE FROM requirements file
    `pip install -r requirements.txt`

# NOTES
### Deactivate (in virtual environment)
    `deactivate`

### If install some new package, remember export to requirement file
    `pip freeze > requirements.txt`

### Run server
    `python manager.py runserver`


