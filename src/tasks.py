from src.main import app

@app.task
def hello():
    print("Hello World!")
    return