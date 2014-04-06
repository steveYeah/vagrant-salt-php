php5:
    pkg.installed

php5-pkgs:
    pkg:
        - installed
        - names:
            - php5-mysql
            - php5-cli
            - php5-intl
            - php5-sqlite
            - php5-dev
            - php-pear
        - require:
            - pkg: php5