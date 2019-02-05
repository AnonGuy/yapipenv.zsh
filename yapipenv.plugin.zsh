yapipenv-check() {
  
  if [[ $PWD/ != $PIPFILE_PATH/* ]] && [ "$PIPFILE_PATH" ]; then
    # Exit if you are outside the pipenv project directory
    export MYPYPATH=${MYPYPATH#"$VIRTUALENV,"}
    export PIPFILE_PATH=""
    deactivate
  fi

  if [ ! "$PIPFILE_PATH" ]; then
    PIPFILE_PATH="$(pipenv --where 2>/dev/null)"

    if [ "$PIPFILE_PATH" ]; then
      # Pipenv environment has not been activated
      export VIRTUALENV=$(pipenv --venv)
      . $VIRTUALENV/bin/activate
      export MYPYPATH=$VIRTUALENV,$MYPYPATH
      export PIPFILE_PATH
    fi
  fi

}

chpwd_functions+=(yapipenv-check)

# Enable pipenv tab completions
eval "$(pipenv --completion)"
