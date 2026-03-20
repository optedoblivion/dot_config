# Lessons Learned: Muramasa Waybar Overhaul

## 1. Arch Linux / Nerd Font v3 Codepoint Shifts
*   **Context:** Rolling-release updates (like `ttf-jetbrains-mono-nerd`) frequently drop legacy codepoints.
*   **Problem:** Icons that worked yesterday may appear as "signal bars" or empty boxes today.
*   **Lesson:** Always verify the modern Nerd Font v3 (NFM) codepoint block. When icons break, use a conversion script (like `nf-update.py`) instead of manually hunting for icons.

## 2. Waybar Group ID Targeting
*   **Context:** Styling Waybar `group` modules.
*   **Problem:** Some Waybar versions are inconsistent in how they resolve IDs for CSS (e.g., `#group-name` vs `#name`).
*   **Lesson:** Always include both `#name` and `#group-name` in the `style.css` selectors to ensure the "pill" background and rounded borders are applied reliably across all Sway/Waybar builds.

## 3. High-Precision Icon Padding (Nerd Fonts)
*   **Context:** Tight grouping of modules in pills.
*   **Problem:** Nerd Font icons often "clip" into the text of the next module because their bounding boxes are narrower than their visual representation.
*   **Lesson:** Add an extra `2px` or `4px` of `padding-right` to icons within pills to prevent visual overlap.
