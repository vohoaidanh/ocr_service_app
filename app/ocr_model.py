from paddleocr import PaddleOCR
from functools import lru_cache

class OCRModel:
    def __init__(self):
        print("🔄 Loading PaddleOCR Model...")
        self.ocr = PaddleOCR(use_angle_cls=True, lang="en")
        print("✅ PaddleOCR Model Loaded!")

    def predict(self, image):
        return self.ocr.ocr(image, cls=True)

@lru_cache()  # Đảm bảo chỉ khởi tạo một lần duy nhất
def get_ocr_model():
    return OCRModel()
