# uwsgi.sockets
#
# Manages the configuration of a directory for uwsgi socket/pid files.
{% from "uwsgi/map.jinja" import uwsgi, sls_block with context %}

uwsgi_emperor_run:
  file.directory:
    - name: {{ uwsgi.run.path }}
    - user: {{ uwsgi.run.uid }}
    - group: {{ uwsgi.run.gid }}
    - dir_mode: {{ uwsgi.run.dir_mode }}
    - file_mode: {{ uwsgi.run.file_mode }}
    - recurse:
      - user
      - group
      - mode
