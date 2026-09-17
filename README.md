# ETL de correo a Excel

Proceso en Python y Docker que busca un correo no leído, descarga el primer adjunto `.xlsx`, extrae columnas configurables y genera una copia `.xlsm` desde una plantilla.

## Configuración

Las credenciales se leen únicamente desde variables de entorno (`GMAIL_USER`, `GMAIL_APP_PASSWORD`, `FROM_SENDER`). Nunca se deben guardar en el repositorio. Usar un buzón y archivos ficticios para una demostración pública.

## Flujo

1. Conecta por IMAP.
2. Filtra mensajes no leídos por remitente y asunto opcional.
3. Descarga el adjunto.
4. Valida hojas y extrae filas.
5. Copia la plantilla y escribe la salida.
6. Marca el mensaje como leído solo después de guardar correctamente.
