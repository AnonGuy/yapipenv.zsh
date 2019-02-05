# yapipenv.zsh

I've written this plugin to fix issues that I've had with existing pipenv integration plugins. <br/>

## Features
- Activate a pipenv project's virtual environment, **if pipenv itself recognises the directory**. This means **I don't have to check if a Pipfile is in the current directory, or the directories above it**. <br/>
- Activate the environment **silently**, without needing to start `pipenv shell`, which visibly enters the activation command.
- Deactivate the virtual environment when you are outside the directory that it was activated in.
- If you switch between directories that are part of different pipenv projects, this plugin will **deactivate the original project, and activate the current one** without needing to `cd .` repeatedly.
- **Enable pipenv's tab completions** so you don't need to get another plugin for it!

## Installation
```bash
zplug 'anonguy/yapipenv.zsh'
```
