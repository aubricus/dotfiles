#!/usr/bin/env bash

# -------------------------------------
# VENV INSTALL
# -------------------------------------

# Turn these off se we can upgrade underlying venv and venvwrapper deps
export PIP_REQUIRE_VIRTUALENV=false
export PIP_RESPECT_VIRTUALENV=false

pip3 install -U pip
pip3 install -U virtualenv
# Had to add this to work around ssl error when installing virtualenv
pip3 install -U pbr
pip3 install -U virtualenvwrapper

# Cleanup
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
