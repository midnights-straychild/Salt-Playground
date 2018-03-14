apache2:
  pkg.installed: []
  service.running:
    - require:
      - pkg: apache2
      
/var/www/index.html:                        # ID declaration
  file:                                     # state declaration
    - managed                               # function
    - source: salt://webserver/index.html   # function arg
    - require:                              # requisite declaration
      - pkg: apache2                        # requisite reference
