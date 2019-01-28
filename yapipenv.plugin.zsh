yapipenv-check() {

  if [[ $PWD/ != $PIPFILE_PATH/* ]] && [ "$PIPFILE_PATH" ]; then
    # Exit if you are outside the pipenv project directory
    export PIPFILE_PATH=""
    deactivate
  fi

  if [ -e "$PWD/Pipfile" ] && [ ! "$PIPENV_ACTIVE" ]; then
    # Pipenv environment has not been activated
    export PIPFILE_PATH="$PWD"
    . $(pipenv --venv)/bin/activate
  fi

}

chpwd_functions+=(yapipenv-check)

# Enable pipenv tab completions
eval "$(pipenv --completion)"
