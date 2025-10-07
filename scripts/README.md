# Recuiva - Embeddings Locales

## Instalación

Para embeddings reales:
```bash
pip install sentence-transformers numpy
```

Para solo demostración (embeddings mock):
```bash
pip install numpy
```

## Ejecución

```bash
cd scripts
python embeddings_local.py
```

## Qué hace el script

1. **Crea texto de muestra** sobre Active Recall
2. **Divide en chunks** de ~400 caracteres
3. **Genera embeddings** (reales o mock según disponibilidad)
4. **Calcula similaridades** coseno entre chunks
5. **Guarda resultados** en JSON con timestamp
6. **Muestra resumen** en consola

## Salida

- Archivo JSON en `output/embeddings_recuiva_YYYYMMDD_HHMMSS.json`
- Resumen en consola con:
  - Número de chunks procesados
  - Dimensión de embeddings (384D)
  - Top-3 pares más similares
  - Estadísticas generales

## Para mostrar al profesor

1. Ejecutar el script
2. Mostrar el resumen en consola
3. Abrir el archivo JSON generado
4. Explicar que es evidencia técnica para HU-010 (embeddings)

## Estructura del JSON de salida

```json
{
  "metadata": {
    "timestamp": "2025-09-30T...",
    "model": "all-MiniLM-L6-v2",
    "total_chunks": 6,
    "dimension": 384
  },
  "chunks": [
    {
      "id": "chunk_001",
      "content": "Active Recall es una técnica...",
      "embedding": {
        "vector": [0.123, -0.456, ...],
        "dimension": 384,
        "norm": 1.0
      }
    }
  ],
  "top_similaridades": [
    {
      "chunk_1": "chunk_001",
      "chunk_2": "chunk_003",
      "similaridad": 0.8234
    }
  ]
}
```

## Evidencia para Notion

- **HU-010**: Embeddings → Estado: Parcial
- **Evidencia**: Captura de consola + archivo JSON
- **Progreso**: Script funcional para generar embeddings locales