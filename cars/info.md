# Samochody - mgr

## LLM + Ontology -> KG

## LLM 

### Ollama - Gemma2

[ollama API docs](https://github.com/ollama/ollama/blob/main/docs/faq.md#how-do-i-configure-ollama-server)

[Gemma docs](https://ai.google.dev/gemma/docs?hl=pl)
[Gemma2 docs](https://ai.google.dev/gemma/docs/model_card_2?hl=pl)
[Gemma Cookbook](https://github.com/google-gemini/gemma-cookbook)

<details>
  <summary>Request to local ollama</summary>

  ```python
  import requests
  import json

  url = "http://localhost:11434/api/generate"

  headers = {
  "Accept": "*/*",
  "User-Agent": "Thunder Client (https://www.thunderclient.com)",
  "Content-Type": "application/json" 
  }

  body = json.dumps({
    "model": "gemma2",
    "prompt":"hi",
    "stream":false
  })

  response = requests.request("POST", url, data=body,  headers=headers)

  print(response.text)
  ```
</details>

<details>
  <summary>Response model</summary>

  ```python
  from datetime import datetime
  from typing import List

  class OllamaGenResponse:
      model: str
      created_at: datetime
      response: str
      done: bool
      done_reason: str
      context: List[int]
      total_duration: int
      load_duration: int
      prompt_eval_count: int
      prompt_eval_duration: int
      eval_count: int
      eval_duration: int

      def __init__(self, model: str, created_at: datetime, response: str, done: bool, done_reason: str, context: List[int], total_duration: int, load_duration: int, prompt_eval_count: int, prompt_eval_duration: int, eval_count: int, eval_duration: int) -> None:
          self.model = model
          self.created_at = created_at
          self.response = response
          self.done = done
          self.done_reason = done_reason
          self.context = context
          self.total_duration = total_duration
          self.load_duration = load_duration
          self.prompt_eval_count = prompt_eval_count
          self.prompt_eval_duration = prompt_eval_duration
          self.eval_count = eval_count
          self.eval_duration = eval_duration
  ```
</details>

## Resources

### Ontology
[Vehicle_1.2](https://enterpriseintegrationlab.github.io/icity/Vehicle/Vehicle_1.2/doc/index-en.html)

<details>
  <summary>other ontologies</summary>

  [schema.org owl](https://github.com/schemaorg/schemaorg/blob/main/data/releases/27.01/schemaorg.owl)

  [w3.org](https://www.w3.org/wiki/WebSchemas/Vehicles)

  [schema.org automotive](https://schema.org/docs/automotive.html)

  [EDMC's Open Knowledge Graphs - Vehicle](https://github.com/edmcouncil/auto/blob/master/VC/VehicleCore.rdf)
</details>

### Cars data
[cars data - kaggle](https://www.kaggle.com/datasets/kanchana1990/vehicle-dataset-2024)

### Articles
[Ontology Development: A Comparing Study on Tools, Languages and Formalisms](https://www.researchgate.net/publication/288258366_Ontology_Development_A_Comparing_Study_on_Tools_Languages_and_Formalisms)

[LLM Ontology-prompting for Knowledge Graph Extraction](https://www.linkedin.com/pulse/llm-ontology-prompting-knowledge-graph-extraction-peter-lawrence/)

[Transforming Unstructured Text into RDF Triples with AI](https://www.linkedin.com/pulse/transforming-unstructured-text-rdf-triples-ai-andrea-volpini-hxhef/)



## misc
1. [auto ui chat ollama](https://mer.vin/2024/06/gemma-2-code-examples/)




---
Rozwiń punkt xx na co najmniej 4 paragrafy tekstu i podaj więcej szczegółowych informacji.


Rozwiń punkt 3.3.2. Przykłady zastosowań Graph RAG na co najmniej 4 paragrafy tekstu i podaj więcej szczegółowych informacji.
