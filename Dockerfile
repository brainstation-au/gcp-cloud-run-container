FROM python:slim

WORKDIR /opt/code

COPY main.py .

CMD ["python", "main.py"]
