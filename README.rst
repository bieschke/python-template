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

    # set up environment
    python3.11 -m venv env
    source env/bin/activate

    # pre-commit hooks
    pip install -r requirements-dev.txt
    pre-commit install

    # dependencies
    pip install -r requirements.txt

    # set env vars
    cp .env.template .env
    vi .env

    # run locally
    python -m main


.gitignore
~~~~~~~~~~

A ``.gitignore`` file is used to specify intentionally untracked files that Git should ignore. Files already tracked by Git are not affected.

Our template's .gitignore file is based on the `GitHub defaults <default-gitignores_>`_.
We use the default `Python .gitignore`_, `Windows .gitignore`_, `Linux .gitignore`_, and `Mac OSX .gitignore`_ concatenated together.
(Released under `CC0-1.0 <https://github.com/github/gitignore/blob/master/LICENSE>`__.)

The Python .gitignore specifications prevent compiled files, packaging and sphinx artifacts, test outputs, etc, from being accidentally committed.
Even though you may develop on one OS, you might find a helpful contributor working on a different OS suddenly issues you a new PR, hence we include the gitignore for all OSes.
This makes both their life and yours easier by ignoring their temporary files before they even start working on the project.

.. _.gitignore: https://git-scm.com/docs/gitignore
.. _default-gitignores: https://github.com/github/gitignore
.. _Python .gitignore: https://github.com/github/gitignore/blob/master/Python.gitignore
.. _Windows .gitignore: https://github.com/github/gitignore/blob/master/Global/Windows.gitignore
.. _Linux .gitignore: https://github.com/github/gitignore/blob/master/Global/Linux.gitignore
.. _Mac OSX .gitignore: https://github.com/github/gitignore/blob/master/Global/macOS.gitignore


.gitattributes
~~~~~~~~~~~~~~

The most important reason to include a `.gitattributes`_ file is to ensure that line endings are normalised, no matter which OS the developer is using.
This is largely achieved by the line::

    * text=auto

which `ensures <gitattributes-text_>`__ that all files Git decides contain text have their line endings normalized to LF on checkin.
This can cause problems if Git misdiagnoses a file as text when it is not, so we overwrite automatic detection based on file endings for some several common file endings.

Aside from this, we also gitattributes to tell git what kind of diff to generate.

Our template .gitattributes file is based on the `defaults from Alexander Karatarakis <alexkaratarakis/gitattributes_>`__.
We use the `Common .gitattributes`_ and `Python .gitattributes`_ concatenated together.
(Released under `MIT License <https://github.com/alexkaratarakis/gitattributes/blob/master/LICENSE.md>`__.)

.. _.gitattributes: https://git-scm.com/docs/gitattributes
.. _gitattributes-text: https://git-scm.com/docs/gitattributes#_text
.. _alexkaratarakis/gitattributes: https://github.com/alexkaratarakis/gitattributes
.. _Common .gitattributes: https://github.com/alexkaratarakis/gitattributes/blob/master/Common.gitattributes
.. _Python .gitattributes: https://github.com/alexkaratarakis/gitattributes/blob/master/Python.gitattributes


Black
~~~~~

Black_ is an uncompromising Python code formatter.
By using it, you cede control over minutiae of hand-formatting.
But in return, you no longer have to worry about formatting your code correctly, since black will handle it.
Blackened code looks the same for all authors, ensuring consistent code formatting within your project.

The format used by Black makes code review faster by producing the smaller diffs.

Black's output is always stable.
For a given block of code, a fixed version of black will always produce the same output.
However, you should note that different versions of black will produce different outputs.
If you want to upgrade to a newer version of black, you must change the version everywhere it is specified:

- requirements-dev.txt, `L1 <https://github.com/scottclowe/python-template-repo/blob/master/requirements-dev.txt#L1>`__
- .pre-commit-config.yaml, `L14 <https://github.com/scottclowe/python-template-repo/blob/master/.pre-commit-config.yaml#L14>`__,
  `L28 <https://github.com/scottclowe/python-template-repo/blob/master/.pre-commit-config.yaml#L28>`__, and
  `L47 <https://github.com/scottclowe/python-template-repo/blob/master/.pre-commit-config.yaml#L47>`__

.. _black: https://github.com/psf/black


pre-commit
~~~~~~~~~~

The template repository comes with a pre-commit_ stack.
This is a set of git hooks which are executed every time you make a commit.
The hooks catch errors as they occur, and will automatically fix some of these errors.

To set up the pre-commit hooks, run the following code from within the repo directory::

    pip install -r requirements-dev.txt
    pre-commit install

Whenever you try to commit code which is flagged by the pre-commit hooks, the commit will not go through.
Some of the pre-commit hooks (such as black_, isort_) will automatically modify your code to fix the issues.
When this happens, you'll have to stage the changes made by the commit hooks and then try your commit again.
Other pre-commit hooks will not modify your code and will just tell you about issues which you'll then have to manually fix.

You can also manually run the pre-commit stack on all the files at any time::

    pre-commit run --all-files

To force a commit to go through without passing the pre-commit hooks use the ``--no-verify`` flag::

    git commit --no-verify

The pre-commit stack which comes with the template is highly opinionated, and includes the following operations:

- Code is reformatted to use the black_ style.
  Any code inside docstrings will be formatted to black using blackendocs_.
  All code cells in Jupyter notebooks are also formatted to black using black_nbconvert_.

- All Jupyter notebooks are cleared using nbstripout_.

- Imports are automatically sorted using isort_.

- flake8_ is run to check for conformity to the python style guide PEP-8_, along with several other formatting issues.

- setup-cfg-fmt_ is used to format any setup.cfg files.

- Several `hooks from pre-commit <pre-commit-hooks_>`_ are used to screen for non-language specific git issues, such as incomplete git merges, overly large files being commited to the repo, bugged JSON and YAML files.
  JSON files are also prettified automatically to have standardised indentation.
  Entries in requirements.txt files are automatically sorted alphabetically.

- Several `hooks from pre-commit specific to python <pre-commit-py-hooks_>`_ are used to screen for rST formatting issues, and ensure noqa flags always specify an error code to ignore.

Once it is set up, the pre-commit stack will run locally on every commit.
The pre-commit stack will also run on github with one of the action workflows, which ensures PRs are checked without having to rely on contributors to enable the pre-commit locally.

.. _black_nbconvert: https://github.com/dfm/black_nbconvert
.. _blackendocs: https://github.com/asottile/blacken-docs
.. _flake8: https://gitlab.com/pycqa/flake8
.. _isort: https://github.com/timothycrosley/isort
.. _nbstripout: https://github.com/kynan/nbstripout
.. _PEP-8: https://www.python.org/dev/peps/pep-0008/
.. _pre-commit: https://pre-commit.com/
.. _pre-commit-hooks: https://github.com/pre-commit/pre-commit-hooks
.. _pre-commit-py-hooks: https://github.com/pre-commit/pygrep-hooks
.. _setup-cfg-fmt: https://github.com/asottile/setup-cfg-fmt
