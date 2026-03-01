# Helios Kernel (helios-core)

`helios-core` is the kernel crate. It is the low-level execution layer that boots, exposes core primitives, and forms the base for the rest of the Helios stack.

For top-level build scripts, shared targets, and project-wide setup, use the main Helios README:  
https://github.com/mhambre/helios

## Build / Run / Debug

From the Helios monorepo root:

```bash
just build core release
just build core debug
```

Kernel debug flow (two terminals):

```bash
# terminal 1
just kernel-qemu-gdb

# terminal 2
just gdb core
```

Direct cargo build (custom target):

```bash
cargo +nightly build \
  -p helios-core \
  -Zjson-target-spec \
  -Z build-std=core \
  --target template/i686-helios.json
```
