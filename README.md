{% comment %}

# django-project-template
A comprehensive python-django project template, including settings for development / virtual env and production webservers.

There are two scenarios 

(I) You are a newcommmer in python django and would like to just have a more advanced starting point for python django than the default (including the option to install/use your project in a (semi) production environment with a real webserver.  

- git clone
- run install
- play


(II) You would like to write a django app and need a good starting point for python django than the default (including the option to install/use your project in a (semi) production environment with a real webserver. 



(I)

later

(II)

## create a virtual env 

We are using the in python3 newly introduced way (recommended) to create a virtual environment (s. )

  python3 -m venv [your_venv_name]
  
  [optional upgrade pip3 and setuptools]
  
  pip3 install --upgrade pip setuptools


and activate the virtual environment:

  source [path_to_env]/bin/activate

  cd [path_to_venv]

## install python django in venv

  pip3 install django
  
## install django project

  django-admin startproject --template=https://github.com/markdoerr/django-project-template/archive/master.zip --extension=py,rst,rb,html,gitignore,json,ini,js,sh,cfg,properties <project_name> .

## install django app from template

  django-admin startapp --template=https://github.com/githubuser/django-app-template/archive/master.zip myapp


## install requirements

cd requirements

## remember to create a git repository
    
    cd [django_project]
    git init
    git remote add origin [remote repo] # this is optional, if you have an remote git repository 
    git add --all
    git commit -m "Initial project layout."
    git push origin master # again optional in case of remote repository

If you want to configure your Django settings module automatically::

    $ echo "export DJANGO_SETTINGS_MODULE='<project_name>.conf.dev'" >> [your_venv]/bin/activate
    $ echo "export DJANGO_SETTINGS_MODULE=''" >> [your_venv]/bin/deactivate
    
**NOTE:** The section above will not be included in your project's README.
Below you'll see the actual project README template.

{% endcomment %}

---------------


You'll need pip-compile to generate the pinned versions of the requirements::

    $ pip install pip setuptools --upgrade (optionally)
    $ pip install pip-tools
    $ cd requirements
    $ pip-compile base.in
    $ cd ..


You'll now have a starting point for your new project. Continue to the
installation instructions below and start at step 3.

To start the project, you can continue to the Installation section, bullet 3.

