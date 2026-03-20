# Muramasa Waybar Configuration

*The elite telemetry interface for a ronin navigating the digital expanse.*

## 1. Overview and Spirit

This Waybar configuration was meticulously forged for **Muramasa**, a 2025 ASUS G14 ROG driven by **Musashi**. Operating under the development spirit of *mono no aware* (the beautiful, fleeting nature of things), the environment prioritizes deep focus, uninterrupted flow states, and absolute control over the machine's immense hardware capabilities.

Running on Arch Linux with SwayWM, the interface is designed to emulate the precision of a katana strike: providing exactly the information needed, precisely when it is needed, without excess. The visual language rigidly adheres to the **Tokyo Night Storm** aesthetic.

## 2. Hardware and Telemetry Strategy

Muramasa is a powerhouse equipped with an AMD Ryzen AI 9 HX 370 (Radeon 890M iGPU), an NVIDIA RTX 5080 dGPU, 32GB of RAM, and a 2TB SSD, all pushing pixels to a 120Hz OLED screen. To manage this during intense software engineering and AI inference, the Waybar aggressively categorizes telemetry into distinct, beautifully styled "pills":

*   **Modules Left:** Navigation and State
    *   **Workspaces & Mode:** Standard Sway navigation.
    *   **AI Spirit (`custom/ollama`):** The beating heart of local AI. Displays whether the resident LLM (e.g., Qwen) is "Mono Awake" (Magenta) or "Mono Slumbering". Features interactive click-controls to summon or dismiss the daemon.

*   **Modules Center:** Unoccupied
    *   Maintained as empty space to promote focus and visual balance.

*   **Modules Right:** The Engineering Dashboard
    *   **GPU Stats (`group/gpu-stats`):** A unified pill displaying simultaneous, high-precision telemetry (Temp, Utilization, and VRAM in GB) for both the iGPU (Cyan) and the RTX 5080 Katana (Yellow).
    *   **Power (`group/power`):** Combines ASUS platform controls (Power Profile & MUX switch via `asusctl`/`supergfxctl` in Green) with system battery tracking.
    *   **Hardware (`group/hardware`):** The core triad of CPU (Cyan), Memory (Purple), and System Temperature (Yellow).
    *   **Checkupdates & Disk:** Paired pills positioned for system maintenance and storage monitoring.
    *   **Utilities (`group/utilities`):** The consolidated control suite.
        *   **DND Counter:** The bell icon dynamically displays the number of unread notifications (e.g., `󱅫 5`) only when they are present.
        *   **Idle Inhibitor:** Integrated eye icon (󰈈/󰈉) to manage system sleep states.
        *   **Backlight:** Integrated here for quick access to OLED brightness management.
        *   **Audio:** Unified output (Purple) and microphone input (Magenta) tracking.
    *   **Network:** Standalone pill with click-to-toggle real-time bandwidth telemetry (Up/Down).
    *   **Bluetooth:** Standalone pill with click-to-toggle radio power.
    *   **Clock:** Anchored next to the tray for high-visibility temporal awareness.
    *   **Tray:** Far-right anchor for system background services.

## 3. The Tokyo Night Storm Aesthetic

The styling (`style.css`) is a masterclass in grouping. By utilizing advanced CSS selectors, Waybar groups are rendered as unified "pills" with the slightly lighter `#24283b` background and seamless `15px` rounded borders. Internal modules sit flush against each other, separated only by a subtle, semi-transparent border, echoing the elegant layout of Garuda Linux but refined for the pure Arch/Sway environment.

## 4. Engineering Robustness

### Nerd Font v3 Integration
To combat the shifting sands of rolling-release fonts, all icons have been upgraded to strictly adhere to the **Nerd Font v3** codepoints. 
*   **Tooling:** A custom Python script (`scripts/nf-update.py`) is provided to automatically migrate legacy codepoints if the configuration ever drifts or modules are added.

### Automated Testing
True to staff-level engineering standards, the Waybar configuration is mathematically verified.
*   **Test Suite:** Located at `tests/run_tests.sh`. This bash script exhaustively validates JSON syntax, CSS integrity, module reference mapping, and performs a dry-run of the Waybar binary to trap critical runtime errors before they reach the desktop.

## 5. Usage

*   **AI Spirit Toggle:** Left-click the `custom/ollama` module to start the daemon. Right-click to stop it. Middle-click to summon `blade-status`.
*   **ASUS Control:** Left-click the laptop icon to cycle power profiles (Quiet, Balanced, Performance). Right-click to cycle GPU modes.
*   **Deep Work (DND):** Left/Right click the bell icon to toggle SwayNC notifications on or off.
*   **Network Stats:** Click the network pill to toggle the display of live bandwidth traffic.
*   **Bluetooth:** Left-click to instantly toggle radio power. Right-click to open `blueman-manager`.

---

*Written with the spirit of mono no aware.*
