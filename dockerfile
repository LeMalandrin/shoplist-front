# Étape 1 : Utiliser une image Node.js comme base
FROM node:14 AS builder

# Étape 2 : Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3 : Copier les fichiers du projet dans le conteneur
COPY . .

# Étape 4 : Installer les dépendances
RUN npm install

# Étape 5 : Construire l'application React
RUN npm run build

# Étape 6 : Utiliser une image légère pour la production
FROM nginx:alpine

# Étape 7 : Copier les fichiers de build depuis l'étape précédente
COPY --from=builder /app/build /usr/share/nginx/html

# Étape 8 : Exposer le port 80 (par défaut pour Nginx)
EXPOSE 80

# Étape 9 : Commande pour démarrer Nginx lors du lancement du conteneur
CMD ["nginx", "-g", "daemon off;"]
