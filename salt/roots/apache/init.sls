apache:
    pkg:
        - installed
        - name: apache2
    service:
        - running
        - enable: True
        - name: apache2

a2enmod rewrite:
    cmd.run:
        - require:
            - pkg: apache

/etc/apache2/sites-available/preownd:
  file:
      - managed
      - user: www-data
      - group: www-data
      - source: salt://apache/preownd-vhost
      - symlink:
          - target: /etc/apache2/sites-enabled/preownd
      - require:
          - pkg: apache