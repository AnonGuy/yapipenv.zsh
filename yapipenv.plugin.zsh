yapipenv-check() {
  
  if [[ $PWD/ != $PIPFILE_PATH/* ]] && [ "$PIPFILE_PATH" ]; then
    # Exit if you are outside the pipenv project directory
    deactivate
    return
  fi

  if [ ! "$PIPFILE_PATH" ]; then
    PIPFILE_PATH="$(pipenv --where 2>/dev/null)"

    if [ "$PIPFILE_PATH" ]; then
      # Pipenv environment has not been activated
      . $(pipenv --venv)/bin/activate
      export PIPFILE_PATH
    fi
  fi

}

chpwd_functions+=(yapipenv-check)

# Enable pipenv tab completions
eval "$(pipenv --completion)"
