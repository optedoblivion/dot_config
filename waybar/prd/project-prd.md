# Project Requirements Document (PRD): Waybar Overhaul for Muramasa

## Context
**User:** musashi
**Hostname:** muramasa
**Spirit of Development:** mono no aware
**OS:** Arch Linux (Garuda-inspired layout), SwayWM, 120Hz OLED screen (ASUS G14 ROG 2025, RTX 5080, 2TB, 32GB RAM).
**Theme:** Tokyo Night Storm (Strict: do not change).

## Goals
Refine the Waybar configuration to be a precise, elegant, and informative interface worthy of an elite AI hacker. Consolidate hardware info, detail AI-centric GPU setups, enhance utility modules (calendar, bluetooth, idle inhibitor), and integrate Ollama controls directly into the bar. Expand the interface to include critical telemetry necessary for heavy, uninterrupted software engineering.

## Actionable Plan (Checkable Items)

- [ ] **1. Consolidate System Hardware Group**
  - Create a Waybar group (`group/hardware`) to encapsulate `cpu`, `memory`, `temperature`, and `battery`.
  - Apply Garuda-like elegant CSS grouping (e.g., unified backgrounds, joined pill borders) strictly using the existing Tokyo Night Storm palette.

- [ ] **2. Create GPU Groups and Sub-Groups**
  - Create a master `group/gpus` or distinct logical groups.
  - **AMD Radeon 890M:** Enhance stats and present cleanly.
  - **NVIDIA RTX 5080:** Enhance the `custom/nvidia` module to show comprehensive stats (Temp, Utilization, VRAM) as needed, and provide a rich tooltip using `blade-status` concepts for AI monitoring.

- [ ] **3. AI Spirit Integration (Ollama)**
  - Update `custom/ollama` to vividly show real-time AI states ("Mono is Resident/Slumbering") and possibly VRAM usage.
  - Implement left/right click actions to toggle Ollama (conceptually mimicking `ollama-on`/`ollama-off` via a terminal spawn or policy kit, e.g., `alacritty -e sudo systemctl start ollama`).

- [ ] **4. Refine Utilities**
  - **Calendar:** Update the `clock` module to include calendar configuration with the `today` format wrapped in HTML tags to appear circled/highlighted (using Tokyo Night colors).
  - **Bluetooth:** Integrate the `bluetooth` module to monitor state and connected devices, aligning with the hardware/utility sections.
  - **Idle Inhibitor:** Validate the configuration and styling of the `idle_inhibitor` module so it accurately reflects swayidle's suppression state and matches the aesthetic.

- [ ] **5. Elite Engineering Additions (New)**
  - **ASUS Control (`asusctl` / `supergfxctl`):** Custom modules to track and toggle the current power profile (Performance/Balanced/Quiet) and GPU mode (Hybrid/Integrated/Discrete). Critical for balancing the 5080's power draw vs. AI capabilities.
  - **Storage Telemetry (`disk`):** Module to monitor the 2TB drive. Essential because heavy Docker environments, LLM weights (GGUFs/Safetensors), and large build artifacts eat space rapidly.
  - **Network Bandwidth (`network` updates):** Add `{bandwidthDownBits}` and `{bandwidthUpBits}`. Critical for tracking massive Git pulls, Hugging Face weight downloads, or Docker image layers.
  - **Deep Work / DND Toggle:** Custom module for SwayNC/Mako to mute notifications instantly for uninterrupted coding flow states.
  - **OLED Protection (`backlight`):** Precise brightness tracking for the 120Hz OLED to prevent burn-in and manage eye strain during long nighttime sessions.
  - **Audio Input (`pulseaudio` mic):** Dedicated microphone indicator/mute toggle, indispensable for remote pair programming or calls.
  - **System Updates (`custom/pacman`):** Subtle indicator of pending Arch/AUR updates, so you control when the rolling release updates happen.

- [ ] **6. Styling Integrity**
  - Write precision CSS to accommodate all new groups and modules.
  - Ensure the high-tech, minimalist "ronin" aesthetic is preserved. No theme alterations.
