# Usa imagem Quarkus (Keycloak moderno)
FROM quay.io/keycloak/keycloak:21.1.1

# Copia temas personalizados (se usares)
COPY themes /opt/keycloak/themes

# Copia o certificado SSL da Azure para o path que o driver PostgreSQL usa
COPY cert/DigiCertGlobalRootCA.crt.pem /opt/keycloak/.postgresql/root.crt

# Variáveis de ambiente essenciais
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_PROXY=edge

# Expõe a porta padrão
EXPOSE 8080

# Comando padrão (Quarkus)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
