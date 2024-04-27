---
thesis-title-en:    LLMs and Knowledge Graphs
                    <!-- TODO: final title --> 
thesis-title-pl:    Wielkie modele językowe i grafy wiedzy
degree:             Master of Science
author:             Jarosław Suchiński
thesis-supervisor:  dr Marcin Skulimowski
publication-date:   4 June 2024
                    <!-- TODO: final date -->
---
# Master of Science thesis
<!-- TODO: Abstract --> ..short description..

## Table of contents
<!-- TODO: TOC --> ..create when ready..

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
6. ***(optional)*** New required python packages shoud be added to requirements.txt and then repeat step 5.

### Testing methods

1. Creating a knowledge graph using LLM (mgr1.ipynb)


    <!-- TODO: mgr1 --> ..short meaningful description..

2. Inject KG into request to LLM to achive RAG (mgr2.ipynb)

    RAG (retrieval-augmented generation) ...
    <!-- TODO: mgr2 --> ..short meaningful description..

## Conclusion
<!-- TODO: Conclusion --> ..conclusion..
