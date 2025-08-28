
from flask import Flask, jsonify, request
app = Flask(__name__)

@app.get('/')
def hello():
    return jsonify(message='Hello from DevOps E2E app!')

@app.get('/healthz')
def health():
    return jsonify(status='ok')

@app.post('/echo')
def echo():
    data = request.get_json() or {}
    return jsonify(received=data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
