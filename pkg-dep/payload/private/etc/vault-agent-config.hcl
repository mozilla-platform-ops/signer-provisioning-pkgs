vault {
    address = "https://vault.relops.mozops.net:8200"
}

exit_after_auth = false
pid_file = "/var/run/vault-agent.pid"

auto_auth {
    method "approle" {
        mount_path = "auth/approle"
        config = {
            role_id_file_path = "/etc/vault_approle_id"
            secret_id_file_path = "/etc/vault_approle_secret"
            remove_secret_id_file_after_reading = false
        }
    }

    sink "file" {
        config = {
            path = "/etc/vault_token"
        }
    }
}

cache {
    use_auto_auth_token = false
}

listener "tcp" {
    address = "127.0.0.1:8200"
    tls_disable = true
}

