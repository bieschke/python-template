Eric Bieschke Repository Template
=================================

This repository is a template repository for Eric Bieschke.


Code Repository
---------------

.. highlight:: bash

.. code-block:: bash
    # get the repo
    git clone git@github.com:this/repo

    cd repo

    # install python
    brew install python@3.13

    # set up environment
    python3.13 -m venv env
    source env/bin/activate

    # pre-commit hooks
    pip install -r requirements-dev.txt
    pre-commit install

    # dependencies
    pip install -r requirements.txt

    # run locally
    python -m main
