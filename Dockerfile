# Usa a imagem oficial atualizada de Keycloak 12.0.1
FROM quay.io/keycloak/keycloak:12.0.1

# Copia temas personalizados, se necessário
COPY themes /opt/jboss/keycloak/themes

# Configura variáveis de ambiente para o PostgreSQL
ENV DB_VENDOR=postgres \
    DB_ADDR=postgresql-service \
    DB_DATABASE=keycloak \
    DB_USER=keycloak \
    DB_PASSWORD=keycloak123 \
    PROXY_ADDRESS_FORWARDING=true \
    KC_PROXY=passthrough \
    JAVA_OPTS="-Xms512m -Xmx1024m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djboss.http.port=8080 -Djboss.https.port=8443"

# Expõe a porta padrão do Keycloak
EXPOSE 8080

# Define o ponto de entrada padrão
ENTRYPOINT ["/opt/jboss/tools/docker-entrypoint.sh"]

CMD ["-b", "0.0.0.0"]


