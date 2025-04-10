# Usa a imagem oficial atualizada do Keycloak 12.0.1
FROM quay.io/keycloak/keycloak:12.0.1

# Copia temas personalizados, se necessário
COPY themes /opt/jboss/keycloak/themes

COPY cert/DigiCertGlobalRootCA.crt.pem /opt/keycloak/.postgresql/root.crt


# Configura variáveis de ambiente essenciais
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_PROXY=edge
ENV PROXY_ADDRESS_FORWARDING=true \
    KC_PROXY=passthrough \
    JAVA_OPTS="-Xms512m -Xmx1024m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djboss.http.port=8080 -Djboss.https.port=8443"

# Expõe a porta padrão do Keycloak
EXPOSE 8080

# Define o ponto de entrada padrão
ENTRYPOINT ["/opt/jboss/tools/docker-entrypoint.sh"]

# Define o comando padrão para iniciar o Keycloak
CMD ["-b", "0.0.0.0"]
