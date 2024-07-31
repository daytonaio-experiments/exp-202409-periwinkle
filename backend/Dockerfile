FROM python:3.11

WORKDIR /workspace

COPY requirements.txt /workspace/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /workspace/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
