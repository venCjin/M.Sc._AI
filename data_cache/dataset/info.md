## Folder na cache danych
żeby nie pobierać i przetwarzać tych samych źródeł danych wiele razy. 
Dane w folderze `(./data_cache/dataset/)` śledzi git-lfs, komenda: <br>
`git lfs track "{name}/**"`

## By wczytać zbiór danych:
```py
from datasets import load_from_disk

dataset = load_from_disk("./data_cache/dataset/{name}")
```

## Zbiory danych:
- wikipediaPL: 
    ```
    Dataset({
      features: ['id', 'url', 'title', 'text'],
      num_rows: 1_611_471
    })
    ```

### git lfs

`data_cache/dataset/wikipediaPL/*.arrow filter=lfs diff=lfs merge=lfs -text`

dane nie mieszcza sie w planie free na github więc przesłałem to na google drive
