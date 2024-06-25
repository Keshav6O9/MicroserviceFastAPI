From python:3.10.13-slim

RUN mkdir -p /app
COPY . main.py /app/
WORKDIR /app
RUN pip install -r requirements.txt
RUN python -m textblob.download_corpora
Expose 8080
CMD ["main.py"]
ENTRYPOINT ["python"]