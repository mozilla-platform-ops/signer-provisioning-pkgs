# signer-provisioning-pkgs

This repository contains macOS PKG installers used for setting up code signer machines.

When a machine is moved to a signer group in SimpleMDM, these PKGs are deployed automatically to establish the baseline environment for the first Puppet run.

---

## Purpose

- Provision signer machines with required tools and configurations.
- Prepare systems for initial Puppet management after group assignment in MDM.

## Notes

- Some packages contain large binaries and are tracked using Git LFS.

## Related Tools

- [munki-pkg](https://github.com/munki/munki-pkg) — used for building these packages