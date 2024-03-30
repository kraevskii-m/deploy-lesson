from flask import Flask, request

app = Flask(__name__)


@app.route("/")
def echo():
    return "You said: " + request.args.get('text', '')


if __name__ == "__main__":
    app.run()
