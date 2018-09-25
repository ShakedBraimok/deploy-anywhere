#A simple Listener app, created with Flask

__author__ = "Shaked Braimok Yosef"

import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def get_hook():
    os.system("docker pull shakedbraimok/example-app && docker stop example-app && docker rm example-app && docker run --name example-app -d --expose 8080 -p 127.0.0.1:8080:8080 -i -t shakedbraimok/example-app /bin/bash")


if __name__ == '__main__':
   app.run()
   