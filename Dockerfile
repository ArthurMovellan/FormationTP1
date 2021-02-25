FROM node

#nom utilisateur
MAINTAINER Arthur Movellan 

#définition du working directory
WORKDIR /app 

#installation de node dans les variables d'environnement du container docker
ENV PATH /app/node_modules/.bin:$PATH

#copie des dépendances du package.json et du package-lock.json dans le container
COPY angular-app/package.json ./
COPY angular-app/package-lock.json ./

#installation du client angular dans le container
RUN npm install -g @angular/cli

#installation de npm dans le container
RUN npm install

COPY angular-app/ ./

#montrer l'app sur le port 4200
EXPOSE 4200

CMD ng serve --host 0.0.0.0