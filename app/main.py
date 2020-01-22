import os

from flask import Flask, jsonify, abort, make_response, request, redirect, url_for, render_template
from flask_cors import CORS
import traceback

from api_utils import make_json_response

try:
    import googleclouddebugger
    googleclouddebugger.enable()
except ImportError:
    pass

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/api/hello-world')
def api_index():
    return make_json_response({'message': 'hello_world'})


@app.route('/api/error')
def api_error():
    raise
    return make_json_response({'message': 'Error'})

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
