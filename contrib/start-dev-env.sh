# Usage: source <script>
# Switch to dev environment
# Sets up the development environment if it does not exist

PROJECT_HOME=$(pwd)
if [ $# -eq 1 ]; then
    PROJECT_HOME=$1
fi

ENV_PREFIX="dev.env"
ENV_PYTHON=python
ENV_DIR=${ENV_PREFIX}.home
ENV_PROMPT=${ENV_PREFIX}

# We know pip is installed, so use it
CMD="pip install"

function virtualize {
    if [ ! -d "$ENV_DIR" ]; then
        virtualenv --system-site-packages --extra-search-dir "${PROJECT_HOME}" -p $(which ${ENV_PYTHON}) --prompt=${ENV_PROMPT} ${ENV_DIR}
        source ${ENV_DIR}/bin/activate
        $CMD coverage nose pep8 --use-mirrors
    else
        source ${ENV_DIR}/bin/activate
    fi

    # Make sure we install any new dependencies
    $CMD -e ${PROJECT_HOME} --use-mirrors

}

if [ ! -f "${PROJECT_HOME}/setup.py" ]; then
        echo "[ERROR] ${PROJECT_HOME}/setup.py not found"
else
	type virtualenv >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		virtualize
	else
		echo "[ERROR] virtualenv command not found, not switching"
	fi
fi

