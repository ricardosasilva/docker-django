#!/bin/bash

export APP_ROOT=${APP_ROOT:-/data/app/}
export STATIC_ROOT=${STATIC_ROOT:-/data/static/}
export PYTHONPATH=$PYTHONPATH:${APP_ROOT}

if [ -n "${INSTALL_REQUIREMENTS}" ]; then
  if [ -f ${APP_ROOT}/requirements.txt ]; then
    pip install -r ${APP_ROOT}/requirements.txt
  fi
fi

chown www-data:www-data -R ${APP_ROOT}
chown www-data:www-data -R ${STATIC_ROOT}

python ${APP_ROOT}/manage.py collectstatic --noinput
supervisord -n -c /etc/supervisor/supervisord.conf