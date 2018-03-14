apache:               # ID declaration
  pkg:                # state declaration
    - installed       # function declaration
      - require:
        - pkg: apache
