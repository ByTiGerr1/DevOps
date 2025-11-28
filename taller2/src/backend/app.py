from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Hello from Backend API"})

@app.route('/api/data')
def data():
    return jsonify({"data": [1, 2, 3, 4, 5]})

def add(a, b):
    return a + b

def unused_function():
    print("This is code smell")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
