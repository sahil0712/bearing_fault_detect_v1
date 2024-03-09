import os
import numpy as np
from tensorflow.keras.preprocessing.image import load_img, img_to_array

def get_img_array(img_path, size):
    img = load_img(img_path, target_size=size)
    array = img_to_array(img)
    array = np.expand_dims(array, axis=0)
    os.remove(img_path)
    return array