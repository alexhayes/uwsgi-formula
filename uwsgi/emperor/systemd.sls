{% from "uwsgi/map.jinja" import uwsgi, sls_block with context %}

uwsgi_emperor_systemd_config:
  file.managed:
    {{ sls_block(uwsgi.emperor.opts) }}
    - name: /etc/systemd/system/uwsgi.emperor.service
    - source: salt://uwsgi/emperor/files/systemd.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
        config: {{ uwsgi.systemd|json() }}

uwsgi_emperor_systemd_service:
  service.running:
    - name: uwsgi.emperor
    - enable: True
    - reload: True
    - require:
      - file: uwsgi_emperor_systemd_config
