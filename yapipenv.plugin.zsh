yapipenv-check() {
  
  if [[ $PWD/ != $PIPENV_ACTIVE/* ]] && [ "$PIPENV_ACTIVE" ]; then
    # Exit if you are outside the pipenv project directory
    export PIPENV_ACTIVE=""
    deactivate
  fi

  if [ ! "$PIPENV_ACTIVE" ]; then
    PIPENV_ACTIVE="$(pipenv --where 2>/dev/null)"

    if [ "$PIPENV_ACTIVE" ]; then
      # Pipenv environment has not been activated
      VIRTUALENV="$(pipenv --venv 2>/dev/null)"
      . $VIRTUALENV/bin/activate
      export PIPVENV=$(eval "echo $VIRTUALENV/lib/*/site-packages")
      export PIPENV_ACTIVE
    fi
  fi

}

chpwd_functions+=(yapipenv-check)

# Enable pipenv tab completions
eval "$(pipenv --completion)"
