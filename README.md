# Code Server - VS Code for Google Compute Engine

This project is a setup to serve VS Code from Google Compute Engine (GCE) in the browser.

## Installation
After creating a VM in GCE ssh in it and clone the repository.

```sh
git clone https://gitlab.com/alest-engineering/code-server-gce.git
```

Enter in the code server paste and run the install script.

```sh
cd code-server-gce
bash install.sh
```

The dependencies will

## Usage
To start or restart the code server run start script:

```sh
bash start.sh
```
The command will give you a IP that is the VM external IP address, access it in your browser and oyu have access the vscode interface.

To stop the code server run stop script:

```sh
bash stop.sh
```
