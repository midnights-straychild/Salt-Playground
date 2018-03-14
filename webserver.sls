apache:               # ID declaration
  pkg:                # state declaration
    - installed       # function declaration
      - require:
        - pkg: apache
/var/www/index.html:                        # ID declaration
  file:                                     # state declaration
    - managed                               # function
    - source: salt://webserver/index.html   # function arg
    - require:                              # requisite declaration
      - pkg: apache                         # requisite reference
