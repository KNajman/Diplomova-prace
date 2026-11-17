# Podklady k prohlášení o použití AI (SR 7/2026, čl. 2e)

Prohlášení je na začátku práce (vedoucí 17. 11. 2026). Text píše Karel, tady jsou jen fakta, ze kterých vychází.
Skill `dp-ai` obsahuje kostru a požadavky směrnice.

## Fakta od Karla (17. 11. 2026)

- **Gemini:** vyzkoušený dříve, nevedl k úspěchu, žádnou část kódu ani textu z něj Karel nepoužil.
  Podle čl. 2e se uvádí jen použití, které ovlivnilo hodnocený výstup; zmínka o Gemini je na Karlově rozhodnutí
  (jedna věta kvůli úplnosti, např. „Nástroj Gemini jsem vyzkoušel, jeho výstupy v práci nejsou použité.“).
- **Claude (Anthropic, model Claude Opus 5.5, prostředí Claude Cowork / Claude Code):** použitý pro kód.
  - Výchozím bodem byla vždy Karlova vlastní implementace každého algoritmu (HLS i VHDL), psaná proto, aby plně
    rozuměl architektuře. Nebyla vždy správná ani podle standardu.
  - Změny, které Claude v kódu provedl, Karel řídil („orchestroval“) tak, aby odpovídaly jeho návrhu.
    Architektonická rozhodnutí jsou jeho vlastní, nebo z odborné literatury, ne od AI.
  - Příklad: třídicí síť pro medián 3 × 3 navrhl Karel sám; až po konzultaci s vedoucím našel v literatuře
    podobná řešení (viz kap. 3 a 5.6).
  - Ověření: bitová shoda s referenčním modelem (C-simulace, kosimulace, xsim) a měření na desce KV260.
- **Text práce:** podle vedoucího má být Karlův; AI pro stylistiku, gramatiku a hledání zdrojů (všechny citované
  zdroje ověřené v originále).
  - **Otevřené:** návrhy kapitol 2, 4 a 6 (1.–16. 11. 2026) napsal Claude. Karel je přepíše vlastními slovy;
    co by zůstalo beze změny, se uvede v prohlášení jako text navržený AI.

## Co z repozitáře doplnit do prohlášení (Karel rozhodne o formulaci)

| část | co AI dělala | ověření |
| --- | --- | --- |
| referenční model `DP/model` | přepis do Jablotron C standardu, generátor konstant, ověření proti OpenCV | unit testy, verify_opencv.py |
| jádra HLS `DP/hls` | úpravy Karlových jader na bitovou shodu s modelem, šablona okénkových jader | C-simulace, kosimulace |
| jádra VHDL `DP/vhdl` | úpravy a optimalizace (pipeline, šířky vzorcem), testbenche | xsim, GHDL |
| testovací řetězec, měřicí aplikace, skripty | skriptovaný blokový návrh, aplikace pro A53, skripty pro Ababel a desku | test na desce 48/48 PASS |
| text | (doplnit podle toho, co zůstane z návrhů kapitol 2, 4 a 6) stylistika a korektura | – |
