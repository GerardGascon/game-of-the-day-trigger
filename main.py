import os
import time
from dotenv import load_dotenv
import schedule
from github import Github
from github import Auth


load_dotenv()
token = os.getenv('GITHUB_TOKEN')
assert token is not None, "GITHUB_TOKEN environment variable not set"
repo = os.getenv('GITHUB_REPOSITORY')
assert repo is not None, "GITHUB_REPOSITORY environment variable not set"
workflow = os.getenv('GITHUB_WORKFLOW')
assert workflow is not None, "GITHUB_WORKFLOW environment variable not set"
branch = os.getenv('GITHUB_BRANCH')
assert branch is not None, "GITHUB_BRANCH environment variable not set"


def trigger():
    g.get_repo(repo).get_workflow(workflow).create_dispatch(ref=branch)


if __name__ == '__main__':
    auth = Auth.Token(token)
    g = Github(auth=auth)

    schedule.every().day.at("00:00", "Europe/Madrid").do(trigger)
    print(schedule.next_run())

    while True:
        schedule.run_pending()
        time.sleep(1)