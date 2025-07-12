from .main import app

@app.task
def hello():
    print("Hello World!")