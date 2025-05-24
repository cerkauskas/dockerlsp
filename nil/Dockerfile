# Build with `docker build -t thecherka/nil-lsp:latest nil/`
# Unfortunately, nix doesn't go well with ARMs yet so I didn't made
# ARM build. Also, I don't use nix on my ARM machines so that's
# fair tradeoff.
FROM nixos/nix
# Create a custom Nix configuration to disable sandboxing
RUN mkdir -p /etc/nix && echo "sandbox = false" > /etc/nix/nix.conf
RUN nix-env -iA nixpkgs.nil
CMD [ "nil" ]
