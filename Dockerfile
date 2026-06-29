FROM python:3.11-slim 

WORKDIR /app 

COPY src/api/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ ./src/

COPY models/trained/ ./models/trained/

# ENV PYTHONPATH=/app
ENV PYTHONPATH=/app:/app/src/api

EXPOSE 8000

CMD ["python", "-m", "uvicorn", "src.api.main:app", "--host", "0.0.0.0", "--port", "8000"]
