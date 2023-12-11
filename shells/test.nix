with import <nixpkgs> { };

let
  venvDir = "./.venv";
  pythonPackages = python3Packages;
in pkgs.mkShell rec {
  name = "impurePythonEnv";
  buildInputs = [
    pythonPackages.python
    pythonPackages.pip
    # Needed when using python 2.7
    # pythonPackages.virtualenv
    # ...
  ];

  # This is very close to how venvShellHook is implemented, but
  # adapted to use 'virtualenv'
  shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)

    if [ -d "${venvDir}" ]; then
      echo "Skipping venv creation, '${venvDir}' already exists"
    else
      echo "Creating new venv environment in path: '${venvDir}'"
      # Note that the module venv was only introduced in python 3, so for 2.7
      # this needs to be replaced with a call to virtualenv
      ${pythonPackages.python.interpreter} -m venv "${venvDir}"
    fi

    # Under some circumstances it might be necessary to add your virtual
    # environment to PYTHONPATH, which you can do here too;
    PYTHONPATH=$PWD/${venvDir}/${pythonPackages.python.sitePackages}/:$PYTHONPATH
    echo "Attempting to activate venv..."
    source "${venvDir}/bin/activate"
    echo "... venv activated!"
    # As in the previous example, this is optional.
    nix-develop
    pip install -r requirements.txt
    #pip install -r requirements.txt --break-system-packages
  '';
}