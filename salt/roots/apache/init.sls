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

/etc/apache2/sites-available/mysite:
  file:
      - managed
      - user: www-data
      - group: www-data
      - source: salt://apache/mysite-vhost
      - require:
          - pkg: apache

/etc/apache2/sites-enabled/mysite:
  file.symlink:
    - target: /etc/apache2/sites-available/mysite