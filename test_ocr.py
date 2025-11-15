import subprocess
import logging

# ロガーの設定
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

def ocr_image_ms(img_input):
    logger.debug("OCR text by Windows.Media.Ocr.Cli")
    text = ""
    command = ["ocr_lib\\Windows.Media.Ocr.Cli.exe", "-l", "ja", img_input]

    proc = subprocess.run(command, capture_output=True)
    
    # 日本語Windowsでよく使用されるエンコーディングを試す
    encodings_try = ["shift-jis", "cp932", "utf-8"]
    
    for enc in encodings_try:
        logger.debug(f"Trying encoding: {enc}")
        try:
            text = proc.stdout.decode(enc)
            logger.debug(f"Successfully decoded with {enc}")
            logger.debug(f"Decoded text length: {len(text)}")
            logger.debug(f"First 100 chars: {text[:100]}")
            if text:
                break
        except UnicodeDecodeError as e:
            logger.debug(f"Failed to decode with {enc}: {str(e)}")
            continue

    return text

if __name__ == "__main__":
    test_image = "cache_screenshot\\2025-01-13_00-32-10-VIDEO\\2025-01-13_00-32-15.png"
    
    try:
        result = ocr_image_ms(test_image)
        print("OCR結果:")
        print(result)
        
    except Exception as e:
        logger.exception("エラーが発生しました")