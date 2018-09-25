#A simple Listener app, created with Flask

__author__ = "Shaked Braimok Yosef"

import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def get_hook():
    os.system("docker pull ShakedBraimok/ExampleApp && docker stop example-app && docker rm example-app && ")
