#!/bin/bash
echo "Starting application..."

pip install streamlit==1.36.0
pip install qdrant-client==1.10.1
pip install sentence-transformers==3.0.1
pip install python-dotenv
pip install --upgrade openai

docker run -d --name qdrant -p 6333:6333 qdrant/qdrant

echo "Time to sleep for 10 seconds"

sleep 10

echo "Time to run the python script"

python ./qdrant_operations.py

streamlit run streamlit_app.py
