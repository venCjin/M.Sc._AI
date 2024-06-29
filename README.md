---
thesis-title-en:    LLMs and Knowledge Graph
thesis-title-pl:    Wielkie modele językowe i grafy wiedzy
degree:             Master of Science
author:             Jarosław Suchiński
thesis-supervisor:  dr Marcin Skulimowski
publication-date:   (?) 2024
---

# Master of Science thesis
<!-- TODO: Abstract --> ..short description..

## Table of contents
1. wstep 
2. cel i zakres pracy
3. teoria
   1. llm (llm chain, llm agents)
   2. rag
      1. 
   3. graph rag
      1. kg    
4. praktyka
   1. baseline rag
      1. wektoryzowanie danych tekstowych
      2. llm chain, llm agents
      3. rag
   2. graph rag
      1. kg - przetwarzanie danych (wyciaganie obiektów i relacji) (wykorzystnaie llm do dostania rdf w określonej ontologii)
      2. llm chain, llm agents
      3. graph rag
   3. wnioski / analiza wyników
5. podsumowanie
6. dalsze możliwości rozwoju tematu
   

## Project
Project is using jupyter notebooks (.ipynb) to provide a meaningful description for executed python code with markdown format.

### Configure enviroment ([based on youtube](https://www.youtube.com/watch?v=Cq08yTa8dQU))
1. create python virtual enviroment
    ```powershell sh
    python -m venv .venv
    ```
2. activate python virtual enviroment
   1. (windows)
        <!--
        Get-ExecutionPolicy -List
        pwsh.exe -ExecutionPolicy Unrestricted
        Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser 
        [Windows ExecutionPolicy](https://learn.microsoft.com/pl-pl/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4)
        [rel](https://techcommunity.microsoft.com/t5/windows-powershell/pwsh-exe-not-recognized-even-after-adding-path/m-p/3680174)
        -->
        ```powershell
        Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
        . .\.venv\Scripts\Activate.ps1
        ```
   1. (mac)
        ```sh
        . ./.venv/bin/activate
        ```
3. create .env file with api keys
    ```ini
    OPENAI_API_KEY=<openai_api_key>
    PINECONE_API_KEY=<pinecone_api_key>
    ```
4. create requirements.txt with required python packages
    ```ini
    python-dotenv
    langchain
    openai
    ```
5. update pip and instal packages
    ```powershell
    pip install --upgrade pip
    pip install -r requirements.txt
    ```
    ---
6. ***(optional)*** New required python packages should be added to requirements.txt and then repeat step 5.

### Testing methods

1. (mgr1.ipynb) LLM-augmented KG construction - Coreference resolution
    Creating a knowledge graph using LLM ?


    <!-- TODO: mgr1 --> ..short meaningful description..

2. Inject KG into request to LLM to achieve RAG (mgr2.ipynb)

    RAG (retrieval-augmented generation) ...
    <!-- TODO: mgr2 --> ..short meaningful description..

## Conclusion
<!-- TODO: Conclusion --> ..conclusion..
