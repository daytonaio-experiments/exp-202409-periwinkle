from qdrant_client import QdrantClient, models
from sentence_transformers import SentenceTransformer
import random as lrandom
from typing import List

qdrant_client = QdrantClient(host="localhost", port=6333)
encoder = SentenceTransformer('BAAI/bge-small-en')

collection_name = "scenarios"

def create_scenarios_collection():
    if not qdrant_client.check_collection_exists(collection_name):
        qdrant_client.create_collection(
            collection_name=collection_name,
            vectors_config=models.VectorParams(size=encoder.get_sentence_embedding_dimension(), distance=models.Distance.COSINE)
        )
        print(f"Collection '{collection_name}' created in Qdrant.")
    else:
        print(f"Collection '{collection_name}' already exists in Qdrant.")

def save_scenario_to_qdrant(project_name, input_text, gherkin_scenario):
    vector = encoder.encode(gherkin_scenario).tolist()
    point_id = lrandom.randint(1, 1000000)
    qdrant_client.upsert(
        collection_name="scenarios",
        points=[models.PointStruct(
            id=point_id,
            payload={"project_name": project_name, "original_text": input_text, "gherkin_scenario": gherkin_scenario},
            vector=vector
        )]
    )
    print("Scenario saved to Qdrant.")

def search_similar_scenarios(query):
    query_vector = encoder.encode(query).tolist()
    hits = qdrant_client.search(
        collection_name=collection_name,
        query_vector=query_vector,
        limit=1,
    )
    return hits

def read_feature_file(file_path: str) -> List[str]:
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()
    
    scenarios = []
    current_scenario_lines = []
    in_scenario_block = False
    
    for line in lines:
        if line.strip().startswith('Scenario:'):
            in_scenario_block = True
        elif line.strip().startswith('Given') or line.strip().startswith('When') or line.strip().startswith('Then'):
            current_scenario_lines.append(line.strip())
        elif line.strip() == '' and in_scenario_block:
            scenarios.append('\n'.join(current_scenario_lines))
            current_scenario_lines = []
            in_scenario_block = False
    
    if current_scenario_lines:
        scenarios.append('\n'.join(current_scenario_lines))
    
    return scenarios

def generate_embeddings(scenarios: List[str]) -> List[List[float]]:
    embeddings = []
    for scenario in scenarios:
        embeddings.append(encoder.encode([scenario]).tolist()[0])
    return embeddings

def save_scenarios_to_qdrant(scenarios: List[str], embeddings: List[List[float]]):
    assert len(scenarios) == len(embeddings), "Number of scenarios must match number of embeddings"
    
    for idx, scenario in enumerate(scenarios):
        vector = embeddings[idx]
        point_id = lrandom.randint(1, 1000000)
        qdrant_client.upsert(
            collection_name=collection_name,
            points=[models.PointStruct(
                id=point_id,
                payload={"gherkin_scenario": scenario},
                vector=vector
            )]
        )
    
    print(f"{len(scenarios)} scenarios saved to Qdrant with embeddings.")


# file_path = './GameDev/shop_for_avatar.feature'
# gherkin_scenarios = read_feature_file(file_path)
# embeddings = generate_embeddings(gherkin_scenarios)
# save_scenarios_to_qdrant(gherkin_scenarios, embeddings)