import numpy as np
from tensorflow.keras.models import load_model

def prediction(array):
    m_xception = load_model(r'model/casting_defect_classification_model.h5')
    preds = m_xception.predict(array)
    prediction = np.round(preds)    
    return prediction