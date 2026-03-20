# PRD - Tokyo Night Storm Theme for Kitty

## 1. Goal
Implement the "Tokyo Night Storm" color theme for the Kitty terminal emulator.

## 2. Requirements
- Create a dedicated theme file `tokyonight_storm.conf`.
- Configure `kitty.conf` to include the theme file.
- Ensure the theme matches the official Tokyo Night Storm palette.
- Provide a clean and modular configuration structure.

## 3. Success Criteria
- Kitty terminal displays with Tokyo Night Storm colors.
- The configuration is easy to maintain and switch if needed.
- No errors in Kitty configuration parsing.

## 4. Tasks
- [x] Research/Verify color palette (Done).
- [x] Create `tokyonight_storm.conf`.
- [x] Create/Update `kitty.conf` to include the theme.
- [x] Verify implementation.

---

# PRD - Kitty Terminal Transparency

## 1. Goal
Enable background transparency in the Kitty terminal emulator to allow the desktop background or other windows to be visible behind the terminal.

## 2. Requirements
- [ ] Configure `background_opacity` in `kitty.conf`.
- [ ] Ensure the transparency level is adjustable and set to a reasonable default (e.g., 0.85).
- [ ] Maintain compatibility with the existing Tokyo Night Storm theme.

## 3. Success Criteria
- [ ] Kitty terminal displays with a semi-transparent background.
- [ ] Text remains legible over the transparent background.
- [ ] The change is documented in `result-documentation.md`.

## 4. Tasks
- [x] Update `prd/design/project-design.md` with implementation details.
- [x] Create `prd/timeline.md` with work estimates.
- [x] Verify Schedule: Check in with the user.
- [x] Apply changes to `kitty.conf`.
- [x] Verify transparency effect.