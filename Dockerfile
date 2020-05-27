FROM python:3

WORKDIR /app

COPY api.py /app
COPY run_api.sh /app

COPY requirements.txt /etc/

RUN pip3 install -r /etc/requirements.txt
#EXPOSE 8000
#RUN ./run_api.sh
#CMD ["gunicorn --log-level debug api.py:app"]

ENTRYPOINT ./run_api.sh