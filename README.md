# Signer Provisioning Packages

This repository contains signed `.pkg` blueprints for provisioning macOS signer hosts using MDM and Vault. Each subdirectory (e.g., `pkg-adhoc`, `pkg-dep`, `pkg-ff`, etc.) is a [munkipkg](https://github.com/munki/munki-pkg) project that builds a macOS installer package with the appropriate configuration, launch daemons, and Vault bootstrap materials.

## 🧱 Directory Layout

```
signer-provisioning-pkgs/
├── pkg-adhoc/     # ADHOC-signed configuration
├── pkg-dep/       # DEP-enrolled hosts
├── pkg-ff/        # Firefox-specific signer setup
├── pkg-tb/        # Thunderbird-specific signer setup
├── pkg-vpn/       # VPN-related signer setup
├── scripts/       # Utility scripts (e.g., signing)
│   └── sign.sh
├── .gitignore
└── README.md
```

## 🛠 Building and Signing

1. Build a package using munkipkg:

```bash
munkipkg pkg-adhoc
```

2. Sign the resulting `.pkg` file:

```bash
./scripts/sign.sh pkg-adhoc/build/"Signer Bootstrap - ADHOC-Signed.pkg"
```

The script will prompt you to select your Developer ID Installer certificate, sign the package, and verify it via `spctl`.

> The signed output will be named `*-signed.pkg` in the same build directory.

## ☁️ MDM Deployment

After signing, these packages are uploaded to your MDM solution for deployment to macOS signer hosts. Upon installation, the machines are bootstrapped into Puppet and Vault via:
- `/private/etc/puppet_role`
- `/private/etc/vault_approle_id`
- `/private/etc/vault-agent-config.hcl`
- `/Library/LaunchDaemons/org.mozilla.bootstrap_mojave.plist`

## 🔧 Requirements

- macOS with Xcode command line tools
- [munkipkg](https://github.com/munki/munki-pkg)
- A valid Developer ID Installer certificate in your login keychain

## 🧼 .gitignore

Be sure to ignore built packages:

```
**/build/
*.pkg
```
