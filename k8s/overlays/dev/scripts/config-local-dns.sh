#!/bin/bash
set -euo pipefail

# Constants
readonly DOMAINS=("greencity.local" "api.greencity.local")

# Function for logging
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Function to check the status of host entry
check_host_entry() {
    local domain=$1
    if grep -q "^127.0.0.1[[:space:]]*${domain}$" /etc/hosts; then
        return 0
    fi
    return 1
}

# Function to add host entry
add_host_entry() {
    local domain=$1
    if ! check_host_entry "$domain"; then
        log "Adding $domain to /etc/hosts"
        echo "127.0.0.1 $domain" | sudo tee -a /etc/hosts > /dev/null
    else
        log "Entry for $domain already exists in /etc/hosts"
    fi
}

# Function to remove host entry
remove_host_entry() {
    local domain=$1
    if check_host_entry "$domain"; then
        log "Removing $domain from /etc/hosts"
        sudo sed -i '' "/^127.0.0.1[[:space:]]*${domain}$/d" /etc/hosts
    else
        log "Entry for $domain not found in /etc/hosts"
    fi
}

# Function to manage host entries
manage_hosts() {
    local action=$1

    for domain in "${DOMAINS[@]}"; do
        case $action in
            add)
                add_host_entry "$domain"
                ;;
            remove)
                remove_host_entry "$domain"
                ;;
            check)
                if check_host_entry "$domain"; then
                    log "✓ Entry for $domain exists"
                    return 0
                else
                    log "✗ Entry for $domain not found"
                    return 1
                fi
                ;;
        esac
    done
}

# + Function to check the status of minikube tunnel
check_minikube_tunnel() {
    log "Checking Minikube tunnel..."
    if ! pgrep -f "minikube tunnel" >/dev/null; then
        log "✗ Minikube tunnel is not running"
        log "Please run 'minikube tunnel' in a separate terminal"
        return 1
    fi

    log "✓ Minikube tunnel is running properly"
    return 0
}

# + Function to check the status of Docker
check_docker() {
    log "Checking Docker status..."

    # Checking if Docker CLI is available
    if ! command -v docker >/dev/null 2>&1; then
        log "✗ Docker is not installed"
        return 1
    fi

    # Checking if Docker daemon is running
    if ! docker info >/dev/null 2>&1; then
        log "✗ Docker daemon is not running"
        case $(uname -s) in
            Darwin)
                log "Please start Docker Desktop application"
                ;;
            Linux)
                log "Please start Docker service with: sudo systemctl start docker"
                ;;
        esac
        return 1
    fi

    log "✓ Docker is running and properly configured"
    return 0
}

# + Function to check the status of minikube
check_minikube() {
    log "Checking Minikube status..."

    # Checking if minikube is installed
    if ! command -v minikube >/dev/null 2>&1; then
        log "✗ Minikube is not installed"
        return 1
    fi

    # Checking minikube status
    if ! minikube status >/dev/null 2>&1; then
        log "✗ Minikube is not running"
        log "Please start Minikube with: minikube start"
        return 1
    fi

    # Getting Minikube IP
    MINIKUBE_IP=$(minikube ip)
    if [[ -z "$MINIKUBE_IP" ]]; then
        log "✗ Could not get Minikube IP"
        return 1
    fi

    log "✓ Minikube is running at IP: $MINIKUBE_IP"
    return 0
}

# +Function to check the status of DNS
check_dns_status() {
    log "Starting DNS configuration check..."
    echo

    # Stage 1: Checking Docker
    if ! check_docker; then
        return 1
    fi
    echo

    # Stage 2: Checking minikube
    if ! check_minikube; then
        return 1
    fi
    echo

    # Stage 3: Checking minikube tunnel
    if ! check_minikube_tunnel; then
        return 1
    fi
    echo

    # Stage 4: Checking host entries
    log "Checking host entries..."
    if ! manage_hosts check; then
        return 1
    fi
    echo

    # If all checks passed successfully
    echo
    log "✓ All DNS checks passed successfully"
    return 0
}

# Function to setup DNS
setup_dns() {
    log "Setting up DNS..."
    manage_hosts add
}

# Function to cleanup DNS
cleanup_dns() {
    log "Cleaning up DNS..."
    manage_hosts remove
}

main() {
    local COMMAND=${1:-}
    if [ -z "$COMMAND" ]; then
        log "Usage: $0 <command>"
        log "Commands: setup, cleanup, status"
        exit 1
    fi

    case $COMMAND in
        setup)
            setup_dns
            ;;
        cleanup)
            cleanup_dns
            ;;
        status)
            check_dns_status
            ;;
        *)
            log "Unknown command: $COMMAND"
            exit 1
            ;;
    esac
}

main "$@"
