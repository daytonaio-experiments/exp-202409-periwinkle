#!/bin/sh

docker run -d --name qdrant -p 6333:6333 qdrant/qdrant

sleep 5

python ./qdrant_operations.py

streamlit run streamlit_app.py
