import sys
import os
from github import Github
from dotenv import load_dotenv

# Load the environment variables from the .env file
load_dotenv()

# Assign the environment variables to variables
project_path = os.getenv("PROJECT_PATH")
username = os.getenv("GITHUB_USER")
password = os.getenv("GITHUB_PASS")

def create():
    # Create the project's folder
    folderName = str(sys.argv[1])
    os.makedirs(project_path + str(folderName)) 

    # Create the github repo
    user = Github(username, password).get_user()
    repo = user.create_repo(folderName)

    # Let the user know the repo was created on github
    print("Succesfully created repository {}".format(folderName))

if __name__ == "__main__":
    create()
