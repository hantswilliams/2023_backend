from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello from a remote server on Flask (server 1) - MAIN PAGE!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)
