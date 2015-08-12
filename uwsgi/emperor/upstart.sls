{% from "uwsgi/map.jinja" import uwsgi, sls_block with context %}

uwsgi_emperor_upstart_config:
  file.managed:
    {{ sls_block(uwsgi.emperor.opts) }}
    - name: /etc/init/uwsgi-emperor.conf
    - source: salt://uwsgi/emperor/files/upstart.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
        config: {{ uwsgi.upstart|json() }}

uwsgi_emperor_upstart_service:
  service.running:
    - name: uwsgi-emperor
    - enable: True
    - reload: True
    - require:
      - file: uwsgi_emperor_upstart_config
