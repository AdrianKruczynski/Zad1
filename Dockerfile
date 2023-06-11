# obraz bazowy
FROM ubuntu:latest
# Informacje o autorze
LABEL author="John Doe"
# Utowrzenie katalogu roboczego
RUN mkdir -p /var/www/html
# Przekopiowanie aplikacji z hosta do kontenera
COPY server/* /var/www/html
# Przejście / Ustawienie katalogu roboczego na /var/www/html
WORKDIR /var/www/html
# Nasłuchiwania na porcie 3000
EXPOSE 3000
# Aktualizacja i popranie npm, nodejs
RUN apt-get update && \
    apt-get install -y npm nodejs
# Pobranie potrzebnych modułów
RUN npm install
# Uruchomienie aplikacji
CMD ["npm", "start"]
