# Design Document - Tokyo Night Storm Theme for Kitty

## 1. Architectural Overview
The configuration will be split into two files:
1. `tokyonight_storm.conf`: Contains the color definitions and theme-specific settings.
2. `kitty.conf`: The main configuration file that includes `tokyonight_storm.conf`.

## 2. Component Design

### 2.1 Theme File (`tokyonight_storm.conf`)
This file will contain:
- Background and foreground colors.
- Cursor colors.
- Tab bar colors.
- Terminal color palette (0-15).

### 2.2 Main Config (`kitty.conf`)
This file will use the `include` directive to load the theme.

## 3. Implementation Details

### Color Palette (Tokyo Night Storm)
- Background: `#24283b`
- Foreground: `#c0caf5`
- ... (and the rest of the palette identified in research)

## 4. Flowchart (Mermaid/PlantUML)
@startuml
start
:Load kitty.conf;
:Include tokyonight_storm.conf;
:Apply Colors;
stop
@enduml

---

# Design Document - Kitty Terminal Transparency

## 1. Architectural Overview
The configuration will add a single setting to the main `kitty.conf` file to control the background opacity without affecting the overall Tokyo Night Storm theme.

## 2. Component Design

### 2.1 Main Config (`kitty.conf`)
This file will be modified to include:
- `background_opacity` setting.
- Default to `0.85` to achieve a semi-transparent effect.

## 3. Implementation Details

- Target file: `kitty.conf`
- Property to add/modify: `background_opacity 0.85`

## 4. Diagrams

### 4.1 Class Diagram
@startuml
class KittyConfig {
    + font_family : String
    + font_size : Float
    + background_opacity : Float
    + includeTheme()
}
@enduml

### 4.2 Flowchart
@startuml
start
:Load kitty.conf;
:Parse background_opacity;
:Load tokyonight_storm.conf;
:Apply Transparency & Colors;
stop
@enduml

### 4.3 Sequence Diagram
@startuml
participant User
participant Kitty
participant OS_Window_Manager

User -> Kitty: Launch Terminal
Kitty -> Kitty: Read kitty.conf
Kitty -> Kitty: Set background_opacity to 0.85
Kitty -> OS_Window_Manager: Request window with alpha channel
OS_Window_Manager --> Kitty: Window created
Kitty --> User: Display transparent terminal
@enduml

### 4.4 Mind Map
@startuml
* Kitty Transparency
** Config
*** kitty.conf
*** background_opacity 0.85
** Effects
*** Desktop visibility
*** Tokyo Night colors preserved
@enduml
