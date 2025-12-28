![Build Status](https://github.com/aniketbhoy/Stock_Price_Prediction/actions/workflows/docker-publish.yml/badge.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/aniketbhoy74/stock-price-prediction)
![Docker Image Size](https://img.shields.io/docker/image-size/aniketbhoy74/stock-price-prediction)

# Stock Price Predictor (Dockerized)

This repository contains a **production-ready, containerized Machine Learning pipeline** that predicts stock price movements using Long Short-Term Memory (LSTM) networks. By using Docker, this project ensures that the model training and inference environment is 100% reproducible regardless of the host operating system.

## Key Features

* **Automated Data Ingestion:** Uses `yfinance` to fetch real-time historical market data.
* **Deep Learning Pipeline:** Implements a stacked LSTM architecture built with TensorFlow/Keras.
* **Robust Preprocessing:** Includes a custom Scikit-Learn `Pipeline` with a `MinMaxScaler` and a sliding-window sequence generator.
* **Environment Isolation:** Fully Dockerized to eliminate "it works on my machine" issues and dependency conflicts.
* **Headless Execution:** Designed to run as a standalone batch job for automated daily predictions.

---

## Tech Stack

* **Language:** Python 3.11
* **ML Frameworks:** TensorFlow, Keras, Scikit-Learn
* **Data Analysis:** Pandas, NumPy, yfinance
* **Containerization:** Docker

---

## Getting Started

### Prerequisites

* Docker installed on your machine.
* (Optional) An Anaconda or Python virtual environment for local development.

### Running with Docker (Recommended)

This is the fastest way to get the model running without installing Python libraries locally.

1. **Pull and Run the Image:**
```bash
docker cp stock-run:/app/prediction_results.csv ./results.csv

```


2. **View Results:**
```bash
docker run --name stock-run stock-predictor

```



---

## Model Architecture

The model utilizes a **Stacked LSTM** approach:

1. **Input Layer:** 60-day look-back window of scaled closing prices.
2. **LSTM Layer 1:** 50 units with `return_sequences=True` to capture temporal patterns.
3. **Dropout (0.2):** To prevent overfitting during training.
4. **LSTM Layer 2:** 50 units to condense temporal information.
5. **Dense Output:** A single neuron predicting the next day's normalized price.

---

## Evaluation Metrics

Upon completion, the container outputs:

* **Mean Squared Error (MSE)**
* **Mean Absolute Error (MAE)**
* **R² Score**

---

## Project Structure

```text
├── stock_prediction.py   # Main logic (Data -> Train -> Predict)
├── Dockerfile            # Container definition
├── requirements.txt      # Python dependencies
├── notebooks/            # Original research and EDA
└── README.md             # This file

```

---

### Future Roadmap

* [ ] Add **Sentiment Analysis** integration from News APIs.
* [ ] Implement **Multi-feature inputs** (Volume, RSI, MACD).
* [ ] Deploy as a **Streamlit Web App** on Hugging Face Spaces.
