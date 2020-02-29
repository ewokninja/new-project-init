#!/bin/bash

# ----- Configure things here -----

PROJ_DIR="/home/jt/bitbucket"
PY_CREATE="/home/jt/bitbucket/new-project-init"
BB_PATH="git@github.com:ewokninja"

# ----- Nothing configurable after this line -----


function create() {
    # Start from somewhere we know... home.
    cd

    # Run the python script to handle the creation of the Github repo
    python $PY_CREATE/create.py $1

    # Move to the newly created project directory
    cd $PROJ_DIR/$1

    # Initialize the repo
    git init

    # Set the origin
    git remote add origin $BB_PATH/$1.git

    # Setup an empty readme file
    touch README.md

    # Add the readme file and commit/push it to the repo
    git add .
    git commit -m "Initial commit"
    git push -u origin master

    # Start VS code in the new project's directory
    code .
}