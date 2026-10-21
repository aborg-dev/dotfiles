#!/usr/bin/env python3
"""Scratchpad-style toggle for the notes window in niri.

Niri has no hidden scratchpad workspace, so "hidden" means parked on the
bottom-most workspace. The window rule for this app-id in niri/config.kdl
makes the window open floating.
"""

import json
import os
import subprocess

APP_ID = "ghostty.notes"
# Indices past the last workspace refer to the bottom (empty) one.
BOTTOM_WORKSPACE = "255"


def niri_query(what):
    output = subprocess.run(
        ["niri", "msg", "--json", what], check=True, capture_output=True, text=True
    ).stdout
    return json.loads(output)


def niri_action(*args):
    subprocess.run(["niri", "msg", "action", *args], check=True)


def find_notes_window():
    return next((w for w in niri_query("windows") if w["app_id"] == APP_ID), None)


def launch():
    subprocess.Popen(
        ["ghostty", f"--class={APP_ID}", "-e", "nvim"],
        cwd=os.path.expanduser("~/notes"),
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        start_new_session=True,
    )


def hide(window):
    niri_action(
        "move-window-to-workspace",
        "--window-id", str(window["id"]),
        "--focus", "false",
        BOTTOM_WORKSPACE,
    )


def show(window):
    current = next(ws for ws in niri_query("workspaces") if ws["is_focused"])
    if window["workspace_id"] != current["id"]:
        niri_action(
            "move-window-to-workspace",
            "--window-id", str(window["id"]),
            "--focus", "false",
            str(current["idx"]),
        )
    niri_action("focus-window", "--id", str(window["id"]))
    if not window["is_floating"]:
        niri_action("move-window-to-floating")


def main():
    window = find_notes_window()
    if window is None:
        launch()
    elif window["is_focused"]:
        hide(window)
    else:
        show(window)


if __name__ == "__main__":
    main()
