FROM python:3.8-slim

# Set the working directory  
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

ENV FLASK_APP=core/server.py
ENV FLASK_ENV=production

# RUN rm -f core/store.sqlite3 && flask db upgrade -d core/migrations/ -- RUN IT EXTERNALLY -> gives error

EXPOSE 5000

CMD ["bash", "run.sh"]
