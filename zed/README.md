# aborg's Zed configuration

Welcome to my Zed configuration!

You can learn more about my workflow on my blog: https://aborg.dev/tags/zed/

## Usage

The keymap is generated from `keymap.jsonnet` using https://jsonnet.org/.

If you want to use this tool for you Zed keymap, first copy over the `*.jsonnet` files to your Zed configuration directory.
Then paste your current configuration into `keymap.jsonnet` and run the following command:
```sh
jsonnet keymap.jsonnet -o keymap.json
prettier --write keymap.json
```

This should generate the `keymap.json` file with the same keybindings as you had before.

Feel free to extend `keymap.lib.jsonnet` with your contexts or other helper functions.
