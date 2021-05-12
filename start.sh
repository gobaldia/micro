cd stocks-api
docker build -t stocks-api .
cd ..
cd encrypter-api
docker build -t encrypter-api . 
cd ..
docker compose up -d