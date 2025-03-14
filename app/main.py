from fastapi import FastAPI, File, UploadFile, Depends
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse

import numpy as np
import cv2
import io
from ocr_model import get_ocr_model

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")


@app.get("/")
async def read_index():
    return FileResponse("static/index.html")

@app.post("/ocr/")
async def perform_ocr(file: UploadFile = File(...), model=Depends(get_ocr_model)):
    contents = await file.read()
    np_image = np.frombuffer(contents, np.uint8)
    image = cv2.imdecode(np_image, cv2.IMREAD_COLOR)

    # Thực hiện OCR
    results = model.predict(image)

    text_results = []
    for line in results:
        for word in line:
            text_results.append({
                "text": word[1][0],
                "confidence": word[1][1],
                "bounding_box": word[0]
            })

    return text_results
