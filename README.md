# Dotfiles personales
 
Este repositorio contiene preferencias personales para usar en Codespaces. Los dotfiles configuran el entorno de quien los usa; no sustituyen la configuración que un proyecto comparte con su equipo.
 
## `install.sh`
 
Codespaces puede ejecutar este script al crear un entorno si este repositorio está habilitado en la configuración personal de Dotfiles. También se puede ejecutar manualmente con `bash install.sh`.
 
El script:
 
- Calcula la ubicación de este repositorio y la muestra en la terminal.
- Añade el contenido de [`.aliases`](.aliases) a `~/.bashrc`, entre marcas identificables. Si encuentra la marca de apertura, omite la inserción para no duplicar el bloque.
- Si Git está disponible, establece la configuración global `pull.rebase=true`, `init.defaultBranch=main` y `core.editor="code --wait"`.
- Muestra un aviso si Git no está disponible y termina con un mensaje de confirmación.
 
Al añadirse a `~/.bashrc`, los aliases están disponibles en nuevas terminales Bash interactivas. Si se modifica `.aliases` después de la primera instalación, el script no actualiza el bloque ya añadido. Las opciones de Git se establecen globalmente para el usuario y pueden reemplazar valores configurados previamente.
 
## `.aliases`
 
Este archivo define abreviaturas de Bash para comandos frecuentes. Se carga mediante `install.sh`.
 
| Alias | Acción |
| --- | --- |
| `ll` | Lista archivos, incluidos los ocultos, con detalles y tamaños legibles (`ls -lah`). |
| `gs` | Muestra el estado breve de Git y la rama actual (`git status -sb`). |
| `gd` | Muestra los cambios sin confirmar (`git diff`). |
| `gl` | Muestra los últimos 20 commits en un gráfico compacto. |
| `api-start` | Entra en `api` y ejecuta `npm start`. |
| `api-test` | Entra en `api` y ejecuta `npm test`. |
| `datos-run` | Entra en `datos` y ejecuta `generar_inventario.py` con Python 3. |
| `verificar` | Ejecuta `scripts/verify.sh`. |
 
Los cuatro últimos atajos son específicos de una estructura de proyecto bajo `/workspaces/`; requieren que existan las rutas y herramientas correspondientes (Node.js/npm o Python 3). Las rutas contienen `*`, que se expande según las carpetas disponibles: si coincide con más de un proyecto, los comandos que usan `cd` pueden fallar por recibir varias rutas. Ajusta esos aliases a la estructura de tus proyectos.
 
