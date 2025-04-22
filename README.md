# Geometry Calculator Web App & Example Automation

Key Words: *Flask Python Docker Jenkins CI CD Automation*

Source code and automation for and example (and very simple) Python Flask Web App

## To Build/Run the Application on Anything that Runs Python:

(Reminder on Windows do not use python3, just python)

1. Clone this repo to any computer capable of running Python 3.

    ```git clone https://github.com/axbjos/geometry_web_automation.git```

2. Install the Python 3 "Virtual Environment" module (best to run this in a venv, Ubuntu example provided.  Other OS will be different.).

    ```sudo apt install python3.8-venv```

3. cd into the application directory.

    ```cd geometry_web_automation/FlaskApplication```

4. Create a Virtual Environment.

    ```python3 -m venv venv```

5. On Ubuntu, activate the Virtual Environment using.

    ```source venv/bin/activate```

6. Install the dependencies.  

    ```pip3 install -r requirements.txt```

7. Run the Application (run on port 5000).   

    ```python3 Geometry.py```

If you want to run the Python Unit tests, use the Pyunit module.  python3 -m unittest <testfile.py>

## To Build/Run the Application as a Docker Container:

Must have a system running the Docker Engine

1. Clone this repo to a server running Docker Engine

    ```git clone https://github.com/axbjos/geometry_web_automation.git```

2. cd into the *geometry_web_complete* directory

    ```cd geometry_web_automation/FlaskApplication```

3. Run Docker Build to build the container

    ```docker build --pull --rm -f "Dockerfile" -t geometrywebdocker:latest "."```

4. Run the container

    ```docker run --rm -d  -p 5000:5000/tcp geometrywebdocker:latest```

---

## Infrastructure Automation Examples

Need a Virtual Server on which to run the Flask App?

Infrastructure Automation examples are provided in the Terraform, Ansible, and Vagrant directories.

Use the Infrastructure Automation Examples for inspiration on how to build your own Infrastructure.

Each directory has its own README file with further details.








