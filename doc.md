# Wielkie modele językowe i grafy wiedzy

## 1. Wstęp
1.1. Wprowadzenie do tematu

1.2. Znaczenie i rola wielkich modeli językowych (LLM) w przetwarzaniu języka naturalnego

1.3. Krótkie omówienie RAG (Retrieval Augmented Generation) i jego znaczenia

1.4. Znaczenie grafów wiedzy (Knowledge Graphs, KG) i ontologii RDF

1.5. Cel i struktura pracy

## 2. Cel i zakres pracy

2.1. Cel główny: Porównanie wydajności standardowego RAG z Graph RAG

2.2. Szczegółowe cele badawcze

2.3. Zakres pracy: Przetwarzanie danych o samochodach, tworzenie wektorów tekstowych, budowa grafu wiedzy

2.4. Ograniczenia i założenia badania

## 3. Część teoretyczna

### 3.1. Opis LLM oraz LLM chain, LLM agents

#### 3.1.1. Definicja i ewolucja wielkich modeli językowych (LLM)
Wielkie modele językowe (LLM) to zaawansowane modele przetwarzania języka naturalnego, które zostały wytrenowane na ogromnych korpusach tekstów, umożliwiając im rozumienie, generowanie i tłumaczenie języka naturalnego. Przykłady takich modeli to GPT-3, BERT, czy T5. Ewolucja LLM zaczęła się od prostszych modeli, takich jak n-gramy i modele Markowa, aż po nowoczesne architektury bazujące na transformatorach, które są w stanie uchwycić złożone zależności semantyczne w tekstach.

#### 3.1.2. Mechanizm działania LLM
Wielkie modele językowe (LLM) działają na bazie architektury transformatorów, które zostały wprowadzone w pracy "Attention is All You Need" przez Vaswaniego i in. w 2017 roku. Transformator składa się z dwóch głównych komponentów: enkodera i dekodera. W modelach językowych, takich jak GPT (Generative Pre-trained Transformer), używany jest głównie dekoder, natomiast BERT (Bidirectional Encoder Representations from Transformers) korzysta z enkodera. Kluczowym elementem tej architektury jest mechanizm uwagi (attention), który pozwala modelowi skupić się na istotnych częściach sekwencji wejściowej podczas generowania sekwencji wyjściowej.

Mechanizm uwagi umożliwia modelom językowym efektywne przetwarzanie sekwencji tekstowych poprzez przypisywanie różnym słowom w zdaniu różnych wag, co pozwala modelowi na zrozumienie kontekstu każdego słowa. W praktyce oznacza to, że model może "zwracać uwagę" na odpowiednie części tekstu, aby lepiej zrozumieć znaczenie danego słowa w kontekście całego zdania. Na przykład, w zdaniu "Kotek goni mysz po ogrodzie", mechanizm uwagi może przypisać większą wagę słowom "kotek" i "mysz" podczas przetwarzania słowa "goni", aby lepiej uchwycić kontekst.

W trakcie treningu, LLM uczą się na dużych zbiorach danych tekstowych, wykorzystując technikę zwrotnej propagacji błędu do aktualizacji wag w sieci neuronowej. Proces treningu polega na minimalizowaniu funkcji straty, która mierzy różnicę między przewidywaną a rzeczywistą wartością wyjściową. W przypadku modeli językowych, funkcja straty często mierzy, jak dobrze model przewiduje kolejne słowo w sekwencji na podstawie wcześniejszych słów. Dzięki trenowaniu na miliardach zdań, LLM są w stanie uczyć się złożonych wzorców językowych i relacji między słowami.

Ponadto, LLM są trenowane w dwóch głównych etapach: pre-treningu i fine-tuningu. W fazie pre-treningu model jest trenowany na dużym korpusie tekstowym, aby nauczyć się ogólnych wzorców językowych. Następnie, w fazie fine-tuningu, model jest dostosowywany do konkretnych zadań lub domen poprzez dalsze treningi na bardziej specjalistycznych danych. Ten dwuetapowy proces pozwala na tworzenie bardzo wszechstronnych modeli, które mogą być łatwo dostosowane do różnych aplikacji, takich jak tłumaczenie maszynowe, odpowiadanie na pytania czy analiza sentymentu.

Jednym z kluczowych aspektów mechanizmu działania LLM jest także zdolność do uogólniania wiedzy zdobytej na etapie pre-treningu i jej zastosowania do nowych, nieznanych wcześniej zadań. Dzięki temu, nawet jeśli model nie widział wcześniej konkretnego kontekstu lub zapytania, może wykorzystać swoją szeroką bazę wiedzy językowej do wygenerowania odpowiedzi, która jest zarówno trafna, jak i spójna. To właśnie ta zdolność do generalizacji i adaptacji sprawia, że LLM są tak potężnymi narzędziami w przetwarzaniu języka naturalnego.

#### 3.1.3. LLM chains: koncepcja i przykłady zastosowania

LLM chains, czyli łańcuchy wielkich modeli językowych, to koncepcja polegająca na sekwencyjnym łączeniu operacji przetwarzania języka naturalnego, gdzie wyniki jednej operacji stają się wejściem dla kolejnej. W praktyce oznacza to, że model językowy może realizować złożone zadania poprzez podział na mniejsze etapy, z których każdy jest obsługiwany przez odpowiednio przystosowany LLM. Takie podejście pozwala na zwiększenie precyzji i skuteczności przetwarzania złożonych zapytań, gdyż każdy etap może być optymalizowany pod kątem specyficznych wymagań.

Na przykład, w aplikacji do automatyzacji obsługi klienta, LLM chain może obejmować kilka etapów: początkowa klasyfikacja zapytania klienta, wyszukiwanie odpowiednich informacji w bazie wiedzy oraz generowanie spersonalizowanej odpowiedzi. Pierwszy model w łańcuchu może analizować zapytanie i klasyfikować je jako pytanie dotyczące faktury, reklamacji lub wsparcia technicznego. Wynik tej klasyfikacji przekazywany jest do drugiego modelu, który przeszukuje bazę danych w celu znalezienia odpowiednich dokumentów lub artykułów. Ostatecznie, trzeci model generuje odpowiedź na podstawie zebranych informacji, zapewniając klientowi precyzyjne i użyteczne rozwiązanie.

Innym przykładem zastosowania LLM chains jest proces analizy prawniczej. W takim scenariuszu, pierwszy model może odpowiadać za ekstrakcję kluczowych informacji z dokumentu prawnego, takich jak daty, strony zaangażowane i główne kwestie sporne. Te informacje są następnie przekazywane do drugiego modelu, który klasyfikuje je według odpowiednich kategorii prawnych. Na końcu, trzeci model może generować raport lub analizę, która podsumowuje znalezione informacje i sugeruje możliwe następne kroki. Takie podejście pozwala na efektywniejsze przetwarzanie dużych ilości danych prawnych i wspomaga prawników w podejmowaniu decyzji.

W obszarze medycyny, LLM chains mogą być wykorzystane do wspomagania diagnozy i leczenia pacjentów. Na przykład, pierwszy model w łańcuchu może analizować objawy opisane przez pacjenta i klasyfikować je według potencjalnych schorzeń. Następnie, drugi model przeszukuje literaturę medyczną i bazy danych, aby znaleźć najbardziej aktualne i adekwatne informacje dotyczące możliwych diagnoz i zaleceń leczenia. Na końcu, trzeci model generuje raport dla lekarza, który zawiera sugestie diagnostyczne i terapeutyczne. Taki złożony łańcuch przetwarzania może znacznie przyspieszyć proces diagnostyczny i poprawić jakość opieki nad pacjentem.

LLM chains mogą również znaleźć zastosowanie w systemach rekomendacji. Przykładem może być platforma e-commerce, gdzie pierwszy model analizuje historię zakupów i zachowania użytkownika, drugi model identyfikuje podobne produkty lub usługi, a trzeci model generuje spersonalizowane rekomendacje. Dzięki zastosowaniu łańcucha modeli, platforma może zapewnić bardziej trafne i spersonalizowane sugestie dla użytkowników, co z kolei może prowadzić do zwiększenia satysfakcji klienta i wzrostu sprzedaży.

Koncepcja LLM chains jest nie tylko potężnym narzędziem w kontekście przetwarzania języka naturalnego, ale także elastycznym podejściem, które może być dostosowane do różnych dziedzin i zastosowań. Dzięki możliwości segmentacji złożonych zadań na mniejsze, wyspecjalizowane etapy, LLM chains umożliwiają bardziej efektywne i precyzyjne przetwarzanie danych, co otwiera nowe możliwości dla zaawansowanych aplikacji w różnych sektorach.

#### 3.1.4. LLM agents: definicja, funkcjonalność i przykłady użycia

LLM agents, czyli agenci oparte na wielkich modelach językowych, to autonomiczne jednostki przetwarzania języka, które wykorzystują możliwości LLM do realizacji różnych zadań. Agenci ci są projektowani, aby wykonywać specyficzne zadania w sposób samodzielny, co oznacza, że mogą działać niezależnie, podejmować decyzje i generować odpowiedzi bez potrzeby ciągłego nadzoru człowieka. LLM agents mogą być integrowani z różnymi systemami, takimi jak chatboty, asystenci wirtualni, systemy doradcze i inne aplikacje oparte na przetwarzaniu języka naturalnego.

Funkcjonalność LLM agents obejmuje szeroki zakres zadań językowych, takich jak rozumienie i generowanie tekstu, klasyfikacja zapytań, wyszukiwanie informacji, tłumaczenie języka, ekstrakcja informacji, analiza sentymentu oraz dialog z użytkownikiem. Agenci ci są w stanie interpretować złożone zapytania, przetwarzać duże ilości danych tekstowych i generować odpowiedzi, które są zarówno trafne, jak i spójne kontekstowo. Dzięki zdolności do uogólniania wiedzy zdobytej na etapie treningu, LLM agents mogą adaptować się do nowych zadań i kontekstów, co czyni je bardzo wszechstronnymi narzędziami.

Jednym z najczęstszych zastosowań LLM agents są chatboty i wirtualni asystenci. Przykładem może być wirtualny asystent obsługi klienta, który wykorzystuje LLM do automatycznego odpowiadania na pytania klientów, rozwiązywania problemów technicznych, czy zarządzania rezerwacjami. Dzięki zaawansowanym możliwościom językowym, tacy agenci mogą prowadzić naturalne i efektywne rozmowy z użytkownikami, co poprawia doświadczenie klienta i odciąża pracowników od rutynowych zadań.

W sektorze medycznym, LLM agents mogą być wykorzystywani jako wsparcie dla lekarzy i pacjentów. Na przykład, agent może analizować objawy pacjenta opisane w języku naturalnym, przeszukiwać bazy danych medycznych i sugerować możliwe diagnozy oraz opcje leczenia. Taki agent może również odpowiadać na pytania pacjentów dotyczące ich stanu zdrowia, leków czy procedur medycznych, co zwiększa dostępność informacji i wspomaga proces podejmowania decyzji przez lekarzy.

Innym interesującym zastosowaniem LLM agents jest analiza danych biznesowych. Przykładem może być agent, który analizuje duże zbiory danych finansowych, generuje raporty i dostarcza rekomendacje dla menedżerów. Taki agent może przetwarzać informacje z różnych źródeł, takich jak raporty finansowe, wiadomości branżowe i media społecznościowe, aby dostarczać kompleksowe analizy i wspierać strategiczne decyzje biznesowe.

W edukacji, LLM agents mogą pełnić rolę inteligentnych tutorów, którzy wspierają proces nauczania i uczenia się. Na przykład, agent może odpowiadać na pytania uczniów, tłumaczyć trudne pojęcia, sugerować dodatkowe materiały do nauki oraz monitorować postępy ucznia. Dzięki interaktywności i zdolności do personalizacji, tacy agenci mogą znacząco poprawić efektywność nauczania i uczynić proces edukacyjny bardziej angażującym.

LLM agents stanowią nową generację narzędzi przetwarzania języka naturalnego, które dzięki swojej autonomii i zaawansowanym możliwościom językowym mogą znaleźć zastosowanie w wielu różnych dziedzinach. Ich zdolność do samodzielnego działania, adaptacji do nowych kontekstów i realizacji szerokiego zakresu zadań językowych czyni je niezwykle wartościowymi narzędziami, które mogą znacząco usprawnić procesy w różnych sektorach przemysłu i usług.

### 3.2. RAG

#### 3.2.1. Definicja i koncepcja RAG

Retrieval Augmented Generation (RAG) to zaawansowana technika przetwarzania języka naturalnego, która łączy dwa kluczowe komponenty: wyszukiwanie informacji (retrieval) i generowanie tekstu (generation). Celem RAG jest poprawa jakości generowanych odpowiedzi poprzez wykorzystanie zewnętrznych źródeł wiedzy, co pozwala na bardziej trafne i kontekstowe odpowiedzi na pytania użytkowników. Koncepcja ta stanowi istotny postęp w dziedzinie systemów pytanie-odpowiedź (QA) oraz aplikacji NLP, gdzie istotne jest nie tylko rozumienie pytania, ale także dostarczenie precyzyjnych informacji opartych na dużych bazach danych.

W klasycznym podejściu do generowania tekstu, modele językowe bazują wyłącznie na wewnętrznej wiedzy zdobytej podczas treningu na dużych zbiorach danych. Chociaż takie modele, jak GPT-3, są niezwykle potężne, mają one ograniczenia związane z ich statycznym charakterem. Nie są w stanie dynamicznie uwzględniać nowych informacji, które pojawiły się po zakończeniu treningu. RAG rozwiązuje ten problem, integrując komponent wyszukiwania informacji, który umożliwia modelowi dostęp do najnowszych i najbardziej relewantnych danych z zewnętrznych źródeł, takich jak bazy danych, artykuły, dokumenty czy strony internetowe.

Architektura RAG składa się z dwóch głównych elementów: retrievera i generatora. Retriever odpowiada za wyszukiwanie i wybieranie najbardziej adekwatnych fragmentów tekstu z bazy danych w odpowiedzi na zapytanie użytkownika. W praktyce może to oznaczać wykorzystanie metod takich jak BM25 (Best Matching 25) lub bardziej zaawansowanych technik opartych na sieciach neuronowych, takich jak Dense Passage Retrieval (DPR). Te techniki pozwalają na efektywne przeszukiwanie dużych zbiorów danych i identyfikowanie fragmentów tekstu, które są najbardziej zgodne z zapytaniem.

Po wybraniu odpowiednich fragmentów tekstu, przekazywane są one do generatora, który jest zazwyczaj oparty na wielkim modelu językowym (LLM). Generator ten, mając dostęp do zewnętrznych danych dostarczonych przez retrievera, tworzy odpowiedź na zapytanie użytkownika. Dzięki integracji z wyszukiwaniem informacji, generowane odpowiedzi są nie tylko oparte na wewnętrznej wiedzy modelu, ale również wzbogacone o aktualne i dokładne informacje z zewnętrznych źródeł. To pozwala na tworzenie bardziej kompleksowych odpowiedzi, które są istotne dla użytkownika.

RAG znajduje zastosowanie w wielu dziedzinach, w tym w systemach wsparcia technicznego, gdzie może odpowiadać na skomplikowane pytania dotyczące produktów na podstawie dokumentacji technicznej, oraz w medycynie, gdzie może dostarczać aktualne informacje na temat diagnostyki i leczenia chorób. Dzięki zdolności do łączenia statycznej wiedzy modeli językowych z dynamicznymi informacjami z zewnętrznych źródeł, RAG stanowi potężne narzędzie, które znacząco zwiększa efektywność i użyteczność aplikacji NLP.

#### 3.2.2. Architektura i komponenty RAG

Architektura Retrieval Augmented Generation (RAG) łączy w sobie dwa główne komponenty: retrievera (moduł wyszukiwania informacji) i generatora (moduł generowania tekstu). Każdy z tych komponentów pełni specyficzne funkcje, które współpracują, aby zapewnić, że model może generować odpowiedzi oparte na aktualnych i relewantnych informacjach.

**Retriever:**

Retriever jest odpowiedzialny za wyszukiwanie i wybieranie najbardziej adekwatnych fragmentów tekstu z bazy danych w odpowiedzi na zapytanie użytkownika. Działa on na zasadzie wyszukiwania informacji, gdzie na podstawie zadanego pytania przeszukuje zewnętrzne źródła danych w celu znalezienia potencjalnie użytecznych informacji. Istnieją różne techniki używane w retrieverach, w tym tradycyjne metody, takie jak BM25 (Best Matching 25), oraz bardziej zaawansowane podejścia oparte na sieciach neuronowych, takie jak Dense Passage Retrieval (DPR).

BM25 jest statystycznym modelem wyszukiwania informacji, który ocenia przydatność dokumentów na podstawie częstości występowania zapytania oraz ich pozycjonowania w dokumencie. Z kolei Dense Passage Retrieval wykorzystuje zaawansowane techniki uczenia maszynowego, aby zakodować zarówno zapytania, jak i dokumenty w przestrzeni wektorowej, co umożliwia bardziej precyzyjne dopasowanie zapytań do dokumentów poprzez obliczanie odległości w tej przestrzeni.

**Generator:**

Generator w architekturze RAG jest odpowiedzialny za tworzenie ostatecznej odpowiedzi na podstawie informacji dostarczonych przez retrievera. Jest to zazwyczaj duży model językowy, taki jak GPT-3 lub T5, który posiada zdolność do generowania spójnych i koherentnych tekstów. Generator integruje kontekst zapytania użytkownika z zewnętrznymi informacjami dostarczonymi przez retrievera, aby stworzyć odpowiedź, która jest zarówno trafna, jak i bogata w treść.

Podczas generowania odpowiedzi, generator może korzystać z różnych technik, aby efektywnie połączyć informacje z retrievera. Może to obejmować mechanizmy uwagi, które pozwalają modelowi skupić się na kluczowych fragmentach dostarczonych danych, oraz różne metody agregacji informacji, które integrują wielorakie źródła danych w spójny sposób.

**Interakcja między komponentami:**

Kluczowym aspektem architektury RAG jest sposób, w jaki retriever i generator współpracują ze sobą. Proces ten zazwyczaj rozpoczyna się od otrzymania zapytania od użytkownika, które następnie jest przetwarzane przez retrievera. Retriever przeszukuje bazy danych i wybiera najbardziej relewantne fragmenty tekstu, które następnie są przekazywane do generatora. Generator, mając dostęp do tych fragmentów, tworzy odpowiedź, która jest nie tylko oparta na wbudowanej wiedzy modelu, ale także wzbogacona o aktualne informacje z zewnętrznych źródeł.

W niektórych implementacjach, retriever może zwracać nie tylko pojedynczy fragment, ale zestaw najbardziej odpowiednich dokumentów, które następnie są używane przez generator do stworzenia bardziej kompleksowej odpowiedzi. W takich przypadkach, generator może również oceniać znaczenie poszczególnych dokumentów, używając mechanizmu uwagi, aby skupić się na najbardziej istotnych informacjach.

**Zalety architektury RAG:**

Architektura RAG oferuje szereg korzyści w porównaniu do tradycyjnych modeli generowania tekstu. Przede wszystkim, umożliwia ona dynamiczne uwzględnianie najnowszych informacji, co jest szczególnie istotne w szybko zmieniających się dziedzinach, takich jak medycyna, technologia czy wiadomości. Ponadto, integracja komponentu wyszukiwania informacji pozwala na tworzenie odpowiedzi, które są bardziej precyzyjne i bogate w treść, co poprawia jakość interakcji z użytkownikiem.

Dzięki zaawansowanej architekturze i zdolności do integracji zewnętrznych danych, RAG stanowi potężne narzędzie w przetwarzaniu języka naturalnego, które może znaleźć zastosowanie w wielu różnych dziedzinach, od obsługi klienta po systemy doradcze i edukacyjne.

#### 3.2.3. Przykłady zastosowań RAG w różnych dziedzinach

Retrieval Augmented Generation (RAG) znajduje szerokie zastosowanie w wielu dziedzinach, dzięki swojej zdolności do łączenia generowania tekstu z dynamicznym wyszukiwaniem informacji. Oto kilka szczegółowych przykładów zastosowań RAG w różnych branżach:

**1. Obsługa klienta:**

W dziedzinie obsługi klienta RAG może znacząco poprawić jakość i efektywność interakcji z klientami. Tradycyjne chatboty często polegają wyłącznie na statycznej wiedzy zawartej w modelu, co może prowadzić do niepełnych lub nieaktualnych odpowiedzi. RAG, dzięki integracji z bazami danych i zewnętrznymi źródłami informacji, może dynamicznie wyszukiwać i dostarczać najbardziej aktualne odpowiedzi na pytania klientów. Na przykład, w przypadku firmy technologicznej, RAG może przeszukiwać dokumentację techniczną, artykuły pomocy technicznej i bazy wiedzy, aby dostarczyć precyzyjne odpowiedzi na pytania dotyczące rozwiązywania problemów z oprogramowaniem lub sprzętem.

**2. Medycyna:**

W medycynie, zastosowanie RAG może znacząco wspomóc proces diagnostyki i leczenia pacjentów. Lekarze i personel medyczny mogą korzystać z systemów opartych na RAG do wyszukiwania najnowszych badań, protokołów leczenia i artykułów medycznych, co pozwala na podejmowanie bardziej poinformowanych decyzji. Na przykład, w przypadku rzadkich chorób, gdzie standardowe modele mogą nie mieć wystarczającej wiedzy, RAG może przeszukiwać specjalistyczne bazy danych i najnowsze publikacje naukowe, aby dostarczyć aktualne informacje o możliwych metodach leczenia i najnowszych odkryciach naukowych.

**3. Edukacja:**

W edukacji RAG może wspierać uczniów i nauczycieli poprzez dostarczanie precyzyjnych i zaktualizowanych informacji na temat różnych tematów nauczania. Na przykład, uczniowie przygotowujący się do egzaminów mogą zadawać pytania dotyczące określonych zagadnień, a system oparty na RAG może przeszukiwać bazy danych edukacyjnych i dostarczać szczegółowe odpowiedzi oraz rekomendacje dotyczące materiałów do nauki. Dodatkowo, nauczyciele mogą korzystać z takich systemów do tworzenia bardziej interaktywnych i angażujących lekcji, gdzie RAG dostarcza bieżących informacji i przykładów, które są najbardziej relewantne dla omawianego tematu.

**4. Badania naukowe:**

W kontekście badań naukowych, RAG może być niezwykle pomocny w przeszukiwaniu ogromnych ilości literatury i danych badawczych. Naukowcy mogą korzystać z systemów RAG do szybkiego wyszukiwania odpowiedzi na pytania badawcze, identyfikowania kluczowych publikacji oraz przeglądania najnowszych badań w danej dziedzinie. Na przykład, badacz w dziedzinie biotechnologii może zadać pytanie dotyczące specyficznych genów lub mechanizmów biologicznych, a system RAG przeszuka bazy danych naukowych i dostarczy najbardziej aktualne i istotne informacje, co znacznie przyspieszy proces badawczy.

**5. Finanse i analizy biznesowe:**

W sektorze finansowym i biznesowym RAG może wspierać analityków w podejmowaniu lepszych decyzji inwestycyjnych i strategicznych. Systemy RAG mogą przeszukiwać raporty finansowe, wiadomości rynkowe, analizy ekonomiczne i inne źródła informacji, aby dostarczyć kompleksowe i aktualne analizy. Na przykład, analityk finansowy może korzystać z RAG do uzyskania szybkiego przeglądu sytuacji rynkowej, oceny ryzyka inwestycji lub identyfikacji trendów ekonomicznych, co pozwala na bardziej trafne i oparte na danych decyzje.

**6. Prawo:**

W dziedzinie prawa, RAG może wspierać prawników i konsultantów prawnych poprzez szybkie wyszukiwanie i analizowanie przepisów prawnych, orzeczeń sądowych i innych dokumentów prawniczych. Na przykład, prawnik przygotowujący się do sprawy sądowej może zadać pytania dotyczące precedensów prawnych lub interpretacji przepisów, a system RAG przeszuka bazy danych prawnych i dostarczy najbardziej relewantne informacje. To znacznie skraca czas potrzebny na badanie i przygotowanie się do sprawy, co zwiększa efektywność pracy prawnika.

Dzięki szerokiemu zakresowi zastosowań i zdolności do dynamicznego wyszukiwania informacji, RAG stanowi potężne narzędzie, które może znacznie poprawić jakość i efektywność pracy w wielu różnych dziedzinach. Integracja wyszukiwania informacji z generowaniem tekstu pozwala na tworzenie bardziej trafnych odpowiedzi, co otwiera nowe możliwości w zastosowaniach NLP.

#### 3.2.4. Zalety i wyzwania związane z RAG

**Zalety RAG:**

Jedną z głównych zalet Retrieval Augmented Generation (RAG) jest zdolność do dostarczania bardziej trafnych i aktualnych odpowiedzi poprzez integrację zewnętrznych źródeł informacji. Tradycyjne modele językowe są ograniczone do wiedzy zdobytej podczas treningu, co oznacza, że nie mogą dynamicznie reagować na nowe informacje pojawiające się po zakończeniu procesu treningowego. RAG rozwiązuje ten problem, łącząc generowanie tekstu z dynamicznym wyszukiwaniem informacji. Dzięki temu odpowiedzi generowane przez RAG są bardziej aktualne, precyzyjne i kontekstowe, co jest szczególnie istotne w szybko zmieniających się dziedzinach, takich jak medycyna, technologia czy finanse.

Kolejną zaletą RAG jest jego wszechstronność. Systemy RAG mogą być dostosowane do różnych zastosowań, od obsługi klienta, przez edukację, po badania naukowe i analizy biznesowe. Dzięki zdolności do przeszukiwania i analizowania dużych zbiorów danych, RAG może wspierać użytkowników w podejmowaniu bardziej informowanych decyzji. Na przykład, w sektorze finansowym, RAG może analizować dane rynkowe i dostarczać rekomendacje inwestycyjne, podczas gdy w medycynie może przeszukiwać najnowsze publikacje naukowe, aby dostarczyć aktualne informacje na temat leczenia chorób.

**Wyzwania związane z RAG:**

Mimo licznych zalet, RAG stawia również przed nami kilka wyzwań. Jednym z głównych wyzwań jest zarządzanie jakością i wiarygodnością zewnętrznych źródeł informacji. Systemy RAG muszą być w stanie ocenić, które źródła są najbardziej wiarygodne i relewantne, aby uniknąć dostarczania nieprawdziwych lub wprowadzających w błąd informacji. Jest to szczególnie trudne w kontekście internetu, gdzie dostępnych jest wiele niezweryfikowanych danych. Dlatego kluczowe jest opracowanie skutecznych mechanizmów filtracji i oceny jakości źródeł, aby zapewnić, że generowane odpowiedzi są oparte na rzetelnych i sprawdzonych informacjach.

Kolejnym wyzwaniem jest integracja i synchronizacja komponentów retrievera i generatora. Proces ten wymaga precyzyjnego dostosowania obu komponentów, aby działały one harmonijnie i efektywnie. Na przykład, retriever musi być w stanie szybko przeszukać bazy danych i dostarczyć relewantne fragmenty tekstu, które następnie są używane przez generator do tworzenia odpowiedzi. Jeśli retriever dostarczy nieadekwatne informacje, jakość generowanej odpowiedzi może znacząco ucierpieć. Dlatego konieczne jest ciągłe doskonalenie algorytmów retrievera oraz mechanizmów łączenia informacji przez generator, aby osiągnąć optymalne wyniki.

**Wydajność i skalowalność:**

Wydajność i skalowalność systemów RAG stanowią kolejne istotne wyzwania. Przeszukiwanie dużych zbiorów danych w czasie rzeczywistym wymaga znacznych zasobów obliczeniowych i efektywnych algorytmów indeksowania. W zależności od wielkości bazy danych i złożoności zapytań, systemy RAG mogą wymagać zaawansowanych rozwiązań infrastrukturalnych, aby zapewnić szybką i efektywną odpowiedź. Ponadto, konieczne jest zarządzanie obciążeniem systemu, aby uniknąć spadku wydajności w przypadku dużej liczby równoczesnych zapytań. Rozwiązania takie jak klastrowanie serwerów, optymalizacja indeksowania danych i zastosowanie technologii chmurowych mogą pomóc w sprostaniu tym wyzwaniom.

**Prywatność i bezpieczeństwo danych:**

W kontekście prywatności i bezpieczeństwa danych, systemy RAG muszą być zaprojektowane w sposób zapewniający ochronę wrażliwych informacji. Wiele aplikacji RAG, szczególnie w medycynie czy finansach, przetwarza dane osobowe, które muszą być odpowiednio chronione przed nieautoryzowanym dostępem i wyciekiem. Implementacja zaawansowanych mechanizmów zabezpieczeń, takich jak szyfrowanie danych, kontrola dostępu i audytowanie, jest niezbędna, aby zapewnić zgodność z regulacjami prawnymi i standardami branżowymi.

Podsumowując, RAG oferuje znaczne korzyści poprzez integrację generowania tekstu z dynamicznym wyszukiwaniem informacji, co pozwala na tworzenie bardziej trafnych i aktualnych odpowiedzi. Niemniej jednak, realizacja tych korzyści wiąże się z szeregiem wyzwań, takich jak zarządzanie jakością źródeł, integracja komponentów, wydajność systemu oraz ochrona prywatności danych. Efektywne rozwiązanie tych wyzwań jest kluczowe dla dalszego rozwoju i zastosowania systemów RAG w różnych dziedzinach.

### 3.3. Graph RAG

#### 3.3.1. Definicja i koncepcja Graph RAG

Graph Retrieval Augmented Generation (Graph RAG) to zaawansowane podejście do przetwarzania języka naturalnego, które łączy tradycyjne techniki Retrieval Augmented Generation (RAG) z wykorzystaniem grafów wiedzy (Knowledge Graphs, KG). Podstawową ideą Graph RAG jest wykorzystanie struktury grafu do organizowania i przetwarzania informacji, co pozwala na bardziej złożone i semantycznie bogate reprezentacje danych. Dzięki temu możliwe jest generowanie bardziej precyzyjnych i kontekstowych odpowiedzi na zapytania użytkowników.

**Definicja Graph RAG:**

Graph RAG to system, który integruje mechanizmy wyszukiwania informacji i generowania tekstu z wykorzystaniem grafów wiedzy. W klasycznym RAG, retriever wyszukuje odpowiednie fragmenty tekstu, które są następnie używane przez generator do tworzenia odpowiedzi. W Graph RAG, zamiast przeszukiwać płaskie zbiory danych tekstowych, retriever przeszukuje graf wiedzy, który składa się z węzłów (reprezentujących pojęcia) i krawędzi (reprezentujących relacje między tymi pojęciami). Dzięki temu system może nie tylko znaleźć odpowiednie informacje, ale również zrozumieć relacje między nimi, co prowadzi do bardziej spójnych i semantycznie trafnych odpowiedzi.

**Koncepcja grafów wiedzy:**

Grafy wiedzy są strukturami danych, które reprezentują informacje w postaci węzłów i krawędzi, tworząc sieć powiązań między różnymi pojęciami. Węzły mogą reprezentować różnorodne byty, takie jak osoby, miejsca, organizacje, wydarzenia, a krawędzie opisują relacje między nimi, na przykład "pracuje dla", "mieszka w", "jest autorem". Taka struktura umożliwia bardziej zaawansowane i elastyczne przetwarzanie informacji, ponieważ pozwala na łatwe nawigowanie po sieci pojęć i zrozumienie kontekstu oraz zależności między nimi.

**Zalety wykorzystania grafów wiedzy w Graph RAG:**

Jedną z głównych zalet Graph RAG jest zdolność do lepszego zrozumienia i wykorzystania kontekstu. Dzięki strukturze grafu, system może efektywnie nawigować po sieci pojęć i identyfikować nie tylko pojedyncze fakty, ale także złożone relacje między nimi. Na przykład, jeśli użytkownik zada pytanie dotyczące konkretnej osoby, Graph RAG może nie tylko znaleźć informacje o tej osobie, ale także uwzględnić kontekst dotyczący jej miejsca pracy, współpracowników, wcześniejszych projektów i innych powiązanych aspektów. To prowadzi do generowania bardziej trafnych i kompleksowych odpowiedzi.

Kolejną zaletą jest możliwość łatwej integracji i aktualizacji danych. Grafy wiedzy mogą być dynamicznie rozszerzane i aktualizowane w miarę pojawiania się nowych informacji. Dzięki temu Graph RAG może korzystać z najnowszych danych bez konieczności przeprowadzania czasochłonnego i kosztownego treningu modelu od podstaw. Ponadto, grafy wiedzy są często wykorzystywane w połączeniu z ontologiami, które definiują standardowe schematy i relacje dla określonych dziedzin, co ułatwia integrację danych z różnych źródeł.

**Przykłady zastosowań Graph RAG:**

Graph RAG znajduje zastosowanie w wielu dziedzinach, gdzie wymagane jest zaawansowane przetwarzanie i analiza informacji. W medycynie, systemy Graph RAG mogą być używane do integracji danych z różnych źródeł, takich jak artykuły naukowe, bazy danych pacjentów i wyniki badań klinicznych, aby dostarczać precyzyjne i spersonalizowane informacje dla lekarzy. W biznesie, mogą wspierać analizy rynkowe i konkurencyjne, łącząc informacje o firmach, produktach, trendach rynkowych i analizach finansowych.

Innym przykładem jest edukacja, gdzie Graph RAG może wspierać tworzenie interaktywnych i dynamicznych materiałów edukacyjnych. Na przykład, uczniowie mogą zadawać pytania dotyczące różnych tematów, a system Graph RAG może przeszukać graf wiedzy, aby dostarczyć nie tylko odpowiedzi, ale także powiązane informacje, które pomogą uczniom lepiej zrozumieć kontekst i zależności między pojęciami.

**Wyzwania związane z Graph RAG:**

Mimo licznych zalet, Graph RAG niesie ze sobą także pewne wyzwania. Jednym z głównych jest złożoność budowy i utrzymania grafów wiedzy. Tworzenie i aktualizowanie grafów wymaga znacznych zasobów, zarówno pod względem technologii, jak i wiedzy eksperckiej. Konieczne jest również zapewnienie spójności i dokładności danych, aby uniknąć błędów i nieścisłości, które mogą wpływać na jakość generowanych odpowiedzi.

Innym wyzwaniem jest optymalizacja wydajności. Przeszukiwanie dużych grafów wiedzy może być zasobochłonne i wymagać zaawansowanych algorytmów, aby zapewnić szybki i efektywny dostęp do informacji. Ponadto, integracja grafów wiedzy z tradycyjnymi komponentami RAG wymaga precyzyjnego dostrojenia, aby zapewnić harmonijną współpracę i maksymalizację korzyści płynących z obu podejść.

Podsumowując, Graph RAG to zaawansowane podejście łączące generowanie tekstu z dynamicznym wyszukiwaniem informacji i strukturą grafów wiedzy, co umożliwia bardziej precyzyjne i kompleksowe odpowiedzi na zapytania użytkowników. Choć niesie ze sobą pewne wyzwania, jego zalety sprawiają, że jest to obiecująca technologia o szerokim spektrum zastosowań.

#### 3.3.2. Przykłady zastosowań Graph RAG
Graph RAG może być wykorzystywany w zaawansowanych systemach pytanie-odpowiedź, gdzie wymagane jest głębokie rozumienie i wykorzystanie wiedzy domenowej, np. w analizach finansowych, medycynie, czy systemach rekomendacji. Przykłady zastosowań obejmują wyszukiwanie odpowiedzi w bazach wiedzy technicznej, gdzie relacje między pojęciami są kluczowe, takich jak:

**1. Medycyna i opieka zdrowotna:**

W dziedzinie medycyny, Graph RAG może zrewolucjonizować sposób, w jaki lekarze i badacze uzyskują informacje i podejmują decyzje. Grafy wiedzy mogą łączyć różnorodne źródła danych, takie jak wyniki badań klinicznych, publikacje naukowe, bazy danych pacjentów oraz informacje o lekach i terapii. Na przykład, podczas diagnostyki rzadkiej choroby, system oparty na Graph RAG może przeszukiwać rozbudowany graf wiedzy zawierający informacje o objawach, dostępnych terapiach, wynikach badań i wcześniejszych przypadkach klinicznych. Dzięki temu, lekarze mogą uzyskać spersonalizowane i aktualne rekomendacje dotyczące diagnozy i leczenia, uwzględniające najnowsze odkrycia i praktyki.

**2. Finanse i analizy biznesowe:**

W sektorze finansowym, Graph RAG może wspierać analityków i inwestorów w podejmowaniu bardziej trafnych decyzji inwestycyjnych oraz w analizach rynkowych. Grafy wiedzy mogą integrować dane finansowe, raporty analityczne, informacje o firmach, produktach i trendach rynkowych. Na przykład, jeśli analityk szuka informacji na temat potencjalnego ryzyka inwestycyjnego, system Graph RAG może przeszukać graf wiedzy zawierający dane o konkurentach, zmienności rynku, i powiązaniach między różnymi czynnikami ekonomicznymi. W ten sposób, inwestorzy mogą uzyskać bardziej kompleksowy obraz sytuacji, co pozwala na lepsze przewidywanie trendów i minimalizowanie ryzyka.

**3. Edukacja i e-learning:**

W dziedzinie edukacji, Graph RAG może znacznie wzbogacić doświadczenie uczniów i nauczycieli, dostarczając interaktywnych materiałów edukacyjnych. Grafy wiedzy mogą zawierać informacje z różnych dziedzin nauki, łącząc definicje pojęć, powiązane tematy oraz przykłady zastosowań. Na przykład, podczas nauki o zjawiskach fizycznych, uczniowie mogą zadawać pytania dotyczące konkretnych teorii lub równań, a system Graph RAG może przeszukać graf wiedzy, aby dostarczyć nie tylko odpowiedzi, ale także powiązane informacje, takie jak historyczne odkrycia, zastosowania w praktyce oraz powiązane eksperymenty. Dzięki temu, uczniowie mają możliwość bardziej głębokiego zrozumienia materiału.

**4. Wyszukiwanie informacji i personalizacja treści:**

Graph RAG może być również wykorzystywany w kontekście wyszukiwania informacji i personalizacji treści w różnych aplikacjach, takich jak systemy rekomendacji, wyszukiwarki internetowe czy aplikacje społecznościowe. Grafy wiedzy mogą przechowywać bogate informacje o użytkownikach, ich preferencjach, zainteresowaniach oraz relacjach między różnymi tematami. Na przykład, w e-commerce, system oparty na Graph RAG może przeszukiwać graf wiedzy zawierający informacje o produktach, recenzjach, preferencjach użytkowników i trendach zakupowych. W odpowiedzi na zapytania użytkowników, system może generować spersonalizowane rekomendacje produktów, uwzględniając zarówno dane historyczne, jak i aktualne informacje o dostępności i promocjach.

**5. Badania naukowe i analiza danych:**

W badaniach naukowych, Graph RAG może wspierać naukowców w analizie i integracji danych z różnych źródeł, takich jak artykuły naukowe, wyniki eksperymentów, i bazy danych. Grafy wiedzy mogą zawierać informacje o pojęciach, teoriach, odkryciach oraz powiązaniach między różnymi badaniami. Na przykład, podczas przeglądania literatury dotyczącej określonego tematu badawczego, system Graph RAG może przeszukiwać graf wiedzy, aby dostarczyć naukowcom nie tylko wyniki badań, ale także powiązane artykuły, wcześniejsze prace, oraz aktualne kierunki badań. Dzięki temu, badacze mogą szybciej identyfikować luki w wiedzy, nowe kierunki badań oraz możliwe współprace.

**6. Prawo i analiza przepisów:**

W dziedzinie prawa, Graph RAG może wspierać prawników i konsultantów prawnych w analizie przepisów, orzeczeń i dokumentów prawnych. Grafy wiedzy mogą łączyć informacje o przepisach prawnych, orzecznictwie, przypadkach sądowych i interpretacjach prawnych. Na przykład, w przypadku analizy skomplikowanego przypadku prawnego, system Graph RAG może przeszukiwać graf wiedzy, aby dostarczyć prawnikom nie tylko informacje o odpowiednich przepisach, ale także kontekst dotyczący wcześniejszych orzeczeń, podobnych przypadków oraz interpretacji prawnych. To umożliwia bardziej efektywne i dokładne przygotowanie strategii prawnej.

**Podsumowanie:**

Graph RAG, dzięki integracji grafów wiedzy z procesem wyszukiwania i generowania informacji, oferuje szerokie możliwości zastosowań w różnych dziedzinach. Umożliwia tworzenie bardziej kompleksowych, kontekstowych i spersonalizowanych odpowiedzi, co może znacząco poprawić jakość interakcji z systemami informacyjnymi. Choć wdrożenie Graph RAG wiąże się z pewnymi wyzwaniami, takimi jak zarządzanie złożonością grafów wiedzy i optymalizacja wydajności, jego zalety sprawiają, że jest to technologia o dużym potencjale dla przyszłości przetwarzania języka naturalnego i analizy danych.

#### 3.3.3. Zalety Graph RAG w porównaniu do standardowego RAG
Zalety Graph RAG obejmują lepsze wykorzystanie strukturalnej wiedzy, co prowadzi do bardziej precyzyjnych i złożonych odpowiedzi. Graph RAG może również lepiej radzić sobie z problemem niepełnych lub wieloznacznych zapytań dzięki wykorzystaniu grafów wiedzy do rozwiązywania niejednoznaczności.

#### 3.3.3.1. Definicja grafu wiedzy (KG)
Graf wiedzy to strukturalna reprezentacja informacji, w której węzły reprezentują pojęcia, a krawędzie reprezentują relacje między nimi. Grafy wiedzy są wykorzystywane do przechowywania i zarządzania złożoną wiedzą w sposób umożliwiający jej efektywne przetwarzanie i wyszukiwanie.

#### 3.3.3.2. Struktura i komponenty KG
Graf wiedzy składa się z węzłów (reprezentujących pojęcia lub encje) oraz krawędzi (reprezentujących relacje między encjami). Dodatkowo, węzły i krawędzie mogą mieć atrybuty, które zawierają dodatkowe informacje. Struktura KG może być hierarchiczna lub bardziej złożona, zależnie od domeny wiedzy.

#### 3.3.3.3. Ontologie RDF: definicja, struktura i znaczenie
RDF (Resource Description Framework) to standard służący do reprezentowania informacji o zasobach w sieci w postaci trójek (subject-predicate-object). Ontologie RDF definiują pojęcia i relacje w danej domenie wiedzy, umożliwiając strukturalne i semantyczne modelowanie informacji. Ontologie RDF są kluczowe dla tworzenia i zarządzania grafami wiedzy.

#### 3.3.3.4. Tworzenie i zarządzanie KG
Tworzenie grafu wiedzy obejmuje procesy ekstrakcji informacji, modelowania danych i definiowania ontologii. Zarządzanie grafem wiedzy obejmuje aktualizację, utrzymanie spójności i zapewnienie jakości danych. Narzędzia i technologie takie jak SPARQL, OWL, i różne silniki baz danych grafowych są używane do efektywnego zarządzania KG.

## 4. Część praktyczna

### 4.1. Baseline RAG
#### 4.1.1. Wektoryzowanie danych tekstowych

4.1.1.1. Opis zbioru danych (dane o samochodach)

4.1.1.2. Metody wektoryzacji tekstu

4.1.1.3. Implementacja i narzędzia wykorzystywane do wektoryzacji

4.1.1.4. Analiza i wybór najlepszych metod wektoryzacji

#### 4.1.2. LLM chain, LLM agents

4.1.2.1. Implementacja LLM chain w kontekście RAG

4.1.2.2. Rola LLM agents w RAG

4.1.2.3. Przykłady implementacji i wyniki

#### 4.1.3. RAG

4.1.3.1. Implementacja standardowego RAG

4.1.3.2. Testowanie i ewaluacja RAG

4.1.3.3. Wyniki i analiza

### 4.2. Graph RAG
#### 4.2.1. KG - przetwarzanie danych

4.2.1.1. Wyciąganie obiektów i relacji z danych tekstowych

4.2.1.2. Wykorzystanie LLM do generowania RDF zgodnie z określoną ontologią

4.2.1.3. Tworzenie i zarządzanie grafem wiedzy

#### 4.2.2. LLM chain, LLM agents

4.2.2.1. Implementacja LLM chain w kontekście Graph RAG

4.2.2.2. Rola LLM agents w Graph RAG

4.2.2.3. Przykłady implementacji i wyniki

#### 4.2.3. Graph RAG

4.2.3.1. Implementacja Graph RAG

4.2.3.2. Testowanie i ewaluacja Graph RAG

4.2.3.3. Porównanie wyników Graph RAG z baseline RAG

### 4.3. Wnioski / analiza wyników

4.3.1. Porównanie wydajności standardowego RAG i Graph RAG

4.3.2. Analiza zalet i wad obu podejść

4.3.3. Dyskusja na temat wyników i ich znaczenia

## 5. Podsumowanie

5.1. Podsumowanie głównych wniosków

5.2. Wnioski na temat wydajności Graph RAG w porównaniu do standardowego RAG

5.3. Ogólne wnioski na temat przetwarzania danych tekstowych i grafów wiedzy

## 6. Dalsze możliwości rozwoju tematu

6.1. Możliwe kierunki dalszych badań

6.2. Propozycje udoskonaleń metodologii

6.3. Zastosowanie innych technologii i narzędzi w przyszłych badaniach

6.4. Potencjalne aplikacje praktyczne wyników badania
