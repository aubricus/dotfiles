#!/usr/bin/env bash

# -------------------------------------
# VENV INSTALL
# -------------------------------------

# Turn these off se we can upgrade underlying venv and venvwrapper deps
export PIP_REQUIRE_VIRTUALENV=false
export PIP_RESPECT_VIRTUALENV=false

pip install -U pip
pip install -U virtualenv
pip install -U virtualenvwrapper

# Cleanup
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true