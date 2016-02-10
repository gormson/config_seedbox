#!/bin/bash

# mise à jour des chmod et du groupe.
# chmod 775 pour les dossiers et chmod 664 pour les fichiers (obligatoire)
find /home/$USER/termines ! -group web -type f -exec chmod 664 {} \;
find /home/$USER/termines ! -group web -type d -exec chmod 775 {} \;
find /home/$USER/termines ! -group web -exec chown $USER:web {} \;

exit 0
