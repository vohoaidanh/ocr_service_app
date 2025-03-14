# PaddleOCR FastAPI Service

This repository provides a simple OCR service using PaddleOCR and FastAPI.

## Features
- Supports image OCR using PaddleOCR
- Simple API with FastAPI
- Dockerized deployment

## Requirements
- Python 3.8+
- pip
- Docker (optional for containerized deployment)

## Installation

Clone the repository:
```bash
git clone https://github.com/vohoaidanh/ocr_service_app.git
cd ocr_service_app/app
```

Install dependencies:
```bash
pip install --no-cache-dir -r requirements.txt
```

## Running the Application

### Without Docker
Run the FastAPI service locally:
```bash
uvicorn main:app --host 0.0.0.0 --port 8000
```

### With Docker
Build and run the Docker container:
```bash
docker build -t paddleocr-fastapi .
docker run -p 8000:8000 paddleocr-fastapi
```

### With Docker Compose
Use `docker-compose` to build and run the service:
```bash
docker-compose up --build
```
To stop the service:
```bash
docker-compose down
```

## API Usage
### OCR Endpoint
Send a POST request with an image file to `/ocr/`:
```bash
curl -X POST "http://localhost:8000/ocr/" \
     -H "accept: application/json" \
     -H "Content-Type: multipart/form-data" \
     -F "file=@image.jpg"
```

### Response Example
```json
[
    {
        "text": "Hello",
        "confidence": 0.98,
        "bounding_box": [[10, 10], [100, 10], [100, 50], [10, 50]]
    }
]
```

## Folder Structure
```
ocr_service_app/
│── app/
│   ├── main.py
│   ├── ocr_model.py
│   ├── requirements.txt
│   ├── static/
│── Dockerfile
│── docker-compose.yml
│── README.md
│── .gitignore
```

## Dockerfile
```dockerfile
FROM python:3.12-slim-bullseye

WORKDIR /app

COPY app /app  

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libgl1 \
        libgomp1 \
        libglib2.0-0 \
        libsm6 \
        libxrender1 \
        libxext6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]
```

## License
This project is licensed under [---].

