import os
from flask import Flask, request
from preprocessing import get_img_array
from prediction import prediction

app = Flask(__name__)

@app.route("/ball-bearing-fault-detect", methods=['POST'])
def ball_bearing_fault_detect():

    content = request.files['file']
    filepath = os.path.join("image", content.filename)
    content.save(filepath)
    array = get_img_array(filepath, (299, 299))
    result = prediction(array)
    return "Working Product" if result == 0 else "Defected Product"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5058)
