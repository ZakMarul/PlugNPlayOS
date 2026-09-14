#!/usr/bin/env bash

# Zaustavi skriptu ako bilo koja naredba vrati grešku
set -e

echo "==> Uklanjanje NixOS generacija starijih od 2 tjedna..."
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +14d

echo "==> Pokretanje Garbage Collectiona (čišćenje siročadi i neiskorištenih trgovina)..."
sudo nix-collect-garbage --delete-old

echo "==> Čišćenje preostalih starih profila i optimizacija spremišta..."
nix-collect-garbage -d

echo "==> Gotovo! Sustav je očišćen."
