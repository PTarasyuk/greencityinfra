#!/bin/bash

# Create directory
mkdir -p k8s/overlays/ci/envs

# Create .db.env
cat << EOF > k8s/overlays/ci/envs/.db.env
POSTGRES_DB=${DATASOURCE_DB}
POSTGRES_USER=${DATASOURCE_USER}
POSTGRES_PASSWORD=${DATASOURCE_PASSWORD}
EOF

# Create .common.env
cat << EOF > k8s/overlays/ci/envs/.common.env
DATASOURCE_URL=${DATASOURCE_URL}
DATASOURCE_USER=${DATASOURCE_USER}
DATASOURCE_PASSWORD=${DATASOURCE_PASSWORD}
EOF

# Create .core.env
cat << EOF > k8s/overlays/ci/envs/.core.env
AZURE_CONNECTION_STRING=${AZURE_CONNECTION_STRING}
AZURE_CONTAINER_NAME=${AZURE_CONTAINER_NAME}
EOF

# Create .user.env
cat << 'EOF' > k8s/overlays/ci/envs/.user.env
MAIL_HOST=""
MAIL_PORT=587
MAIL_USER=""
MAIL_PASSWORD=""
SMTP_AUTH=false
SMTP_ENABLE=false
BACKEND_ADDRESS=""
CLIENT_ADDRESS=""
ECO_NEWS_ADDRESS=""
SENDER_EMAIL_ADDRESS=""
GOOGLE_CLIENT_ID=""
GOOGLE_CLIENT_ID_MANAGER=""
EOF

# Create .dockerconfigjson
# AUTH_BASE64=$(echo -n "PTarasyuk:$GHCR_TOKEN" | base64 | tr -d '\n')
# cat << EOF > k8s/overlays/ci/envs/.dockerconfigjson
# {
#   "auths": {
#     "ghcr.io": {
#       "username": "PTarasyuk",
#       "password": "$GHCR_TOKEN",
#       "auth": "$AUTH_BASE64"
#     }
#   }
# }
# EOF
