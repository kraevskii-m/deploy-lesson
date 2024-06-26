import os

from flask import Flask, request

app = Flask(__name__)


@app.route("/")
def hello():
    return '<form action="/echo" method="GET"><input name="text"><input type="submit" value="Echo"></form>'


@app.route("/echo")
def echo():
    return "You said: " + request.args.get('text', '')


if __name__ == "__main__":
    app.run(
        host=os.environ.get("BACKEND_HOST", "172.0.0.1"),
        port=5000,
        debug=True,
    )
