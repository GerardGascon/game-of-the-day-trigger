FROM python:3.12-alpine

ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
