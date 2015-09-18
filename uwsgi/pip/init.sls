{% from "uwsgi/map.jinja" import uwsgi with context %}

uwsgi_pip:
  pip.installed:
    - name: {{ salt['pillar.get']('uwsgi:lookup:pip', 'uwsgi') }}
    - bin_env: {{ salt['pillar.get']('uwsgi:lookup:pip_bin_env', '/usr/local/bin/pip') }}
    - user: {{ salt['pillar.get']('uwsgi:lookup:pip_user', 'root') }}


