#!/bin/bash

# make sure we're in a virtual environment (useful for running pre-commit hooks from vscode git integration (pylint, etc))
# If there is no virtual environment active, tries to activate one in the default location ~/venvs/<project_folder_name>
#
# Example
# cd my/python/package
# ./ensure_venv.sh pylint src

echo "Starting ensure_venv.sh"

if [ -z "$VIRTUAL_ENV" ]; then
    venv_name=$(basename "$PWD")
    venv_path=~/venvs/$venv_name
    if [ -d "$venv_path" ]; then
        echo "Activating virtual environment at $venv_path"
        source "$venv_path/bin/activate"
    else
        echo "Command is run without a virtual environment in place and the default virtual environment $venv_path does not exist which may cause pylint to fail"
    fi
fi

echo "Executing command: $@"
"$@"
echo "Command execution completed"
