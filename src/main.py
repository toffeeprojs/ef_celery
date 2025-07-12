from os import environ
from celery import Celery

app = Celery(
    "my_celery_app",
    broker=(
        "amqp://"
        f"{environ["RABBITMQ_DEFAULT_USER"]}:{environ["RABBITMQ_DEFAULT_PASS"]}"
        f"@{environ['RABBITMQ_HOST']}:5672/{environ["RABBITMQ_DEFAULT_VHOST"]}"
    ),
    backend="rpc://",
    include=["src.tasks"]
)

app.conf.beat_schedule = {
    "every_30-hello": {
        "task": "src.tasks.hello",
        "schedule": 30.0
    },
}

app.conf.timezone = "UTC"