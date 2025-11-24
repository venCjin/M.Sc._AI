## PL:

Niniejsza praca bada integrację dwóch kluczowych technologii: grafów wiedzy (KG) oraz dużych modeli językowych (LLM), w celu poprawy jakości reprezentacji informacji oraz generowania odpowiedzi w systemach typu pytanie–odpowiedź. Część teoretyczna omawia podstawy KG, ich typy, zalety i ograniczenia, a także ewolucję LLM – od wczesnych modeli opartych na słowach kluczowych po architektury typu Transformer, ze szczególnym uwzględnieniem embeddingów, skalowalności oraz wyzwań, takich jak halucynacje. Głównym punktem jest połączenie KG i LLM poprzez podejścia takie jak Retrieval-Augmented Generation (RAG) oraz Graph RAG, które wykorzystuje struktury grafowe do wieloetapowego rozumowania i analizy kontekstu.

Badanie eksperymentalne obejmuje implementację trzech rozwiązań: Naive RAG (RAG v1), RAG z metadanymi (RAG v2) oraz Graph RAG, testowanych na zbiorze danych IMDB (1 000 filmów, 100 pytań) z użyciem GPT-4.1, Neo4j i Pinecone. Ewaluacja oparta na embeddingach, analizie GPT-4.1 oraz opinii ekspertów wykazuje przewagę Graph RAG w zadaniach wymagających złożonego rozumowania, osiągając dokładność na poziomie 79–87% w porównaniu do 44–57% dla klasycznego RAG.

Wyniki pokazują, że integracja KG–LLM oferuje komplementarne zalety: przetwarzanie informacji w języku naturalnym oraz ustrukturyzowaną wiedzę. Potencjalne zastosowania obejmują analizę procesów biznesowych, systemy wspomagające diagnostykę medyczną oraz systemy rekomendacyjne. Kierunki dalszych badań to redukcja halucynacji, rozwój multimodalnego RAG oraz modularnych frameworków, takich jak RGL.



## ANG:

This thesis explores the integration of two key technologies, knowledge graphs (KG) and large language models (LLM), to enhance information representation and question-answering systems. The theoretical section reviews KG fundamentals, their types, advantages, and limitations, alongside the evolution of LLMs from early keyword-based models to Transformer architectures, highlighting embeddings, scalability, and challenges such as hallucinations. The core focus is on combining KG and LLM through approaches like Retrieval-Augmented Generation (RAG) and Graph RAG, which leverages graph structures for multi-step reasoning and contextual analysis.

The experimental study implements three solutions: Naive RAG (RAG v1), RAG with metadata (RAG v2), and Graph RAG, tested on an IMDB dataset (1,000 films, 100 questions) using GPT-4.1, Neo4j and Pinecone. Evaluation via embeddings, GPT-4.1 analysis, and expert review shows Graph RAG’s superiority in complex reasoning tasks, achieving 79-87% accuracy versus 44–57% for classical RAG.

Findings demonstrate that KG–LLM integration offers complementary strengths: rapid semantic retrieval and structured reasoning. Potential applications include business process analysis, medical diagnostics support systems, and recommendation systems. Future directions involve reducing hallucinations, developing multimodal RAG, and modular frameworks such as RGL.