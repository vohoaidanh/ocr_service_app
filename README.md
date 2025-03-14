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
git clone https://github.com/your-username/your-repo.git
cd your-repo/app
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
project-root/
│── app/
│   ├── main.py
│   ├── ocr_model.py
│   ├── requirements.txt
│   ├── static/
│── Dockerfile
│── README.md
│── .gitignore
```

## License
