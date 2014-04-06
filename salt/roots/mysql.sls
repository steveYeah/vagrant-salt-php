python-mysqldb:
    pkg.installed

mysql-client:
    pkg.installed

mysql-common:
    pkg.installed

mysql-server:
    pkg:
        - installed
    service:
        - running
        - name: mysql
        - require:
          - pkg: mysql-server
          - pkg: mysql-client

    # Make sure a user for the app is present
    # mysqlpassword
    mysql_user.present:
        - name: preownd
        - password_hash: "*5E34E8C9BEC59CA63C2B30F6D06BD36D338E0454"
        - require:
            - service: mysql-server
            - pkg: python-mysqldb

    mysql_grants.present:
        - grant: all
        - database: preownd.*
        - user: preownd
        - require:
            - mysql_user: preownd