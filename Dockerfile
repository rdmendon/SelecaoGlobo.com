FROM python:3

WORKDIR /app

COPY api_contact.py /app

COPY requirements.txt /etc/

RUN pip3 install -r /etc/requirements.txt

RUN nohup gunicorn --log-level debug api:app &
#CMD ["gunicorn --log-level debug api:app"]
ADD / /app

WORKDIR /app

CMD python api.py 