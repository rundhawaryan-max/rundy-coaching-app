---
name: Rebuilt by Ryan
description: True-black, type-only coaching app where today is a checklist that fills white.
colors:
  ground: "#000000"
  ground-pressed: "#0f0f0f"
  ground-field: "#191919"
  ink: "#ffffff"
  ink-secondary: "#b9b9b9"
  ink-tertiary: "#8f8f8f"
  hairline: "rgba(255,255,255,0.12)"
  hairline-strong: "rgba(255,255,255,0.42)"
  late-red: "#ff5a5a"
  inverted-ink-secondary: "#555555"
typography:
  display:
    fontFamily: "'Big Shoulders Display', 'Arial Narrow', Impact, sans-serif"
    fontSize: "40px"
    fontWeight: 800
    lineHeight: 0.92
    letterSpacing: "0.01em"
  display-number:
    fontFamily: "'Big Shoulders Display', 'Arial Narrow', Impact, sans-serif"
    fontSize: "60px"
    fontWeight: 800
    lineHeight: 0.92
    letterSpacing: "0.01em"
  headline:
    fontFamily: "'Big Shoulders Display', 'Arial Narrow', Impact, sans-serif"
    fontSize: "30px"
    fontWeight: 800
    lineHeight: 0.92
    letterSpacing: "0.01em"
  stat:
    fontFamily: "'Big Shoulders Display', 'Arial Narrow', Impact, sans-serif"
    fontSize: "28px"
    fontWeight: 800
    lineHeight: 1
  title:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "16px"
    fontWeight: 600
    lineHeight: 1.3
  body:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "15px"
    fontWeight: 400
    lineHeight: 1.45
  body-small:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: 1.45
  label:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "12px"
    fontWeight: 600
    letterSpacing: "0.14em"
rounded:
  none: "0px"
  xs: "4px"
  sm: "6px"
  md: "10px"
  lg: "16px"
  pill: "999px"
spacing:
  xs: "4px"
  sm: "8px"
  md: "12px"
  lg: "16px"
  xl: "20px"
  2xl: "24px"
  3xl: "32px"
components:
  button-primary:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.md}"
    padding: "0 20px"
    height: "50px"
  button-secondary:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "0 20px"
    height: "50px"
  button-small:
    rounded: "{rounded.md}"
    padding: "0 14px"
    height: "40px"
  button-text:
    backgroundColor: "transparent"
    textColor: "{colors.ink-secondary}"
    rounded: "{rounded.none}"
    padding: "0"
  input:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "12px 14px"
  input-focus:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink}"
  segment:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink-secondary}"
    rounded: "{rounded.md}"
    height: "46px"
  segment-selected:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.md}"
    height: "46px"
  check-row:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    rounded: "{rounded.none}"
    padding: "12px 0"
    height: "62px"
  check-mark:
    backgroundColor: "transparent"
    rounded: "{rounded.sm}"
    size: "28px"
  check-mark-done:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.sm}"
    size: "28px"
  set-check:
    backgroundColor: "transparent"
    rounded: "{rounded.sm}"
    size: "44px"
  set-check-done:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.sm}"
    size: "44px"
  day-ring:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    rounded: "{rounded.pill}"
    size: "108px"
  done-card:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.lg}"
    padding: "24px 20px"
  notice:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "14px 16px"
  tag:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.xs}"
    padding: "3px 6px"
  toast:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.pill}"
    padding: "12px 16px"
  sheet:
    backgroundColor: "{colors.ground}"
    textColor: "{colors.ink}"
    rounded: "{rounded.lg}"
    padding: "26px 20px"
  sheet-inverted:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.lg}"
    padding: "26px 20px"
  bubble-coach:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink}"
    rounded: "{rounded.lg}"
    padding: "11px 14px"
  bubble-client:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.lg}"
    padding: "11px 14px"
  nav-bar:
    backgroundColor: "{colors.ground}"
    textColor: "{colors.ink-tertiary}"
    rounded: "{rounded.none}"
    height: "62px"
  nav-item-current:
    textColor: "{colors.ink}"
---

# Design System: Rebuilt by Ryan

<!-- Scope: this system is extracted from client.html (the client PWA). index.html (the coach dashboard) still carries the previous dark/lime look and is not described here. -->

## Overview

**Creative North Star: "The Gym Chalkboard"**

A black surface, white chalk, and nothing else. The client app is pure type on true black: no imagery, no colour, no gradient, no shadow; corners are softly rounded on a small scale so the black reads friendly rather than severe. The only things that are white at full strength are the words that matter right now and the marks that say something got done. Everything secondary steps down through two greys. The coach's words sit in the largest body size on the screen, and the client's day is a vertical list of rows separated by hairlines, each ending in a square that fills white when ticked.

Density is phone-first and one-handed: a single 560px column with 20px gutters, 62px tap rows, 44px set checks, 50px buttons, and a fixed 62px bottom bar. The condensed display face (Big Shoulders Display at 800) is reserved for screen titles and big numbers; it is what makes a date, a count, or a personal best read like a poster rather than a form. The system sans does all the reading.

State is expressed by inversion. A done check, a selected segment, the current day in the week strip, the client's own message bubble, the toast, the "Day done" card and the PR sheet all flip to white-on-black. The one colour, a warm red, appears only when something is late. The previous lime accent was removed by decision and nothing replaced it.

**Key Characteristics:**
- True black ground (`#000`) with white text and two greys; no tonal surfaces apart from a near-black field fill for inputs
- One condensed display face at weight 800, uppercase, for titles and numbers only
- Rounded corners on one small scale: 6px checks and set cells, 10px inputs, buttons, chips and the today cell, 16px cards, sheets and bubbles, a pill toast
- Hairline dividers (12% white) carry structure; cards are the exception, not the container
- Done means inverted: white square, black check, the same mark on Today, Train and the week strip
- Red (`#ff5a5a`) is a status, not an accent, and it means "late"

## Colors

A monochrome system: black ground, white ink, two grey steps for secondary and tertiary text, two alpha hairlines for structure, one red for lateness.

### Primary
- **Chalk White** (`{colors.ink}`): Primary text, the filled primary button, the done check, the current day in the week strip, selected segments, the client's own message bubble, toasts, the "Day done" card and the inverted PR sheet. White is the active and the completed state.

### Neutral
- **True Black** (`{colors.ground}`): The ground of every screen, the bottom bar, sheets, and the text colour on anything inverted.
- **Pressed Black** (`{colors.ground-pressed}`): Only appears as the `:active` flash on a tapped checklist row and as the fill of a read-only set value cell.
- **Field Black** (`{colors.ground-field}`): The fill of inputs, selects, textareas, segment buttons, the coach's message bubble, photo slots and skeletons. It is the one step above the ground, and it is never used as a card.
- **Secondary Grey** (`{colors.ink-secondary}`): Eyebrows, the brand line, subtitles, done-row labels, field labels, text buttons, the unit suffix on a big number, and logged days in the week strip.
- **Tertiary Grey** (`{colors.ink-tertiary}`): Row sub-lines, placeholders, column headers, timestamps, future days, inactive bottom-bar items and chevrons. The quietest text that still passes on black.
- **Hairline** (`{colors.hairline}`): Every divider: row bottoms, section rules, the nav top, input borders at rest; at 16% it is also the unfilled segment of the day ring.
- **Strong Hairline** (`{colors.hairline-strong}`): The border of an unticked check square (1.5px), a sheet's top edge, a notice box, the "Suggest" toggle, dashed photo-slot borders and underline colour on text buttons.
- **Inverted Secondary** (`{colors.inverted-ink-secondary}`): Secondary text inside the inverted sheet (eyebrow, subtitle, muted).

### Tertiary
- **Late Red** (`{colors.late-red}`): The border of the late check-in notice, the "Late" word in a row sub-line, and the red variant of a tag. Never a button fill, never decoration.

### Named Rules
**The One Colour Rule.** There is no accent. The only hue in the client app is Late Red, and it appears only when something is overdue. A screen with nothing late is black, white and grey.

**The Inversion Rule.** Emphasis and completion are shown by flipping to white-on-black, not by adding colour, weight or glow. If a state needs to be loud, invert it.

## Typography

**Display Font:** Big Shoulders Display, self-hosted at `/fonts/big-shoulders-display.woff2` (variable, weight axis 500–900), with Arial Narrow and Impact as fallbacks
**Body Font:** System sans stack (`-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`)

**Character:** A compressed, shouted display face against a quiet, invisible body face. The display face is uppercase at weight 800 with a tight 0.92 line height and 0.01em tracking; it is used only where a thing is announced (a date, a count, a screen name, a personal best). The system sans carries every sentence, with tabular numerals on by default so set weights and counts line up.

### Hierarchy
- **Display** (800, 40px, 0.92, uppercase): Screen titles ("Sunday Oct 18", "Train", "Progress") and the title line in a sheet. Also the "Day done" card at 48px.
- **Display Number** (800, 60px, 0.92): The large count in a sheet or PR announcement (64px inside sheets). The day count inside the Today ring is 30px (its "/12" 15px in Secondary Grey), the week-strip day numbers 21px, stat values 40px, macro values 30px, PR values 28px. All in the display face; the size steps with the importance of the number.
- **Headline** (800, 30px, 0.92, uppercase): Secondary display title (error screen).
- **Title** (600, 16px, 1.3): Row labels, exercise names (17px), meal names, accordion summaries.
- **Body** (400, 15px, 1.45): Default text. The coach's note runs at 17px; notice copy and list rows at 14px.
- **Body Small** (400, 13px): Row sub-lines, prescriptions, field labels (500), timestamps.
- **Label** (600, 12px, 0.14em, uppercase): The eyebrow, which names a section ("From Ryan", "Today · Cardio", "Daily targets") in Secondary Grey. The brand line uses the same style at 0.16em; set-table column headers at 0.1em in Tertiary Grey; macro keys at 0.06em.

### Named Rules
**The Announcement Rule.** The display face appears only on screen titles and big numbers. Never on a row label, button, eyebrow, body text or input.

**The Eyebrow Rule.** Sections are named with one 12px uppercase eyebrow at 0.14em tracking in Secondary Grey, then content. No section headings in the body face at larger sizes.

## Layout

One centered column, `max-width: 560px`, with 20px side gutters, 14px plus the safe-area inset at the top, and bottom padding of the nav height (62px) plus 28px plus the safe-area inset so the last row clears the fixed bar. There is no multi-column layout; on desktop the column sits centered on black.

Vertical rhythm is section-based: `section` blocks are separated by 32px (6px when marked tight), an eyebrow sits 10px above its content, and stacked items are 10px apart. Rows are flush to the column edges, full width, with a 62px minimum height and 12px vertical padding. Grids are used only for data: the 7-column week strip (4px gap), the set table (`30px 1fr 1fr 76px 44px`, 8px gap), two-column stats and 4-column macros (12px / 8px gaps), and 3-column photo grids (8px gap).

Fixed chrome: a bottom bar (62px plus safe-area), a message composer pinned above the bar, bottom sheets that rise from the bottom edge, and a toast centered 16px above the bar.

## Elevation & Depth

No shadows anywhere. Depth is flat and tonal: the ground is `#000`, input fields and the coach's bubble sit one step up at `#191919`, and a pressed row flashes `#0f0f0f`. Overlays dim the screen with 65% black (sheets) or 96% black (lightbox). Structure is carried entirely by 1px hairlines at 12% white and stronger 1.5px outlines at 42% white. Inversion (white block on black) is the only way a surface comes forward.

### Named Rules
**The No-Card Rule.** Content is not boxed. Rows and sections are separated by hairlines; the only filled white blocks are state announcements (done card, PR sheet, toast). The only outlined box is the notice, and it is reserved for a message that needs attention.

## Shapes

Rounded, lightly. One radius scale, held in `--r-sm` (6px), `--r` (10px) and `--r-lg` (16px): 4px on tags; 6px on check squares and set-table cells; 10px on buttons, inputs, segments, tabs, the week strip's today cell, notices and photo tiles; 16px on the Day done card, the top corners of sheets, and message bubbles (4px on the tail corner so the side is readable); a full pill on the toast. The only circles are the day ring on Today (108px, a 9-unit stroke on a 100-unit viewBox, one segment per checklist row with 4° gaps), the 5px "logged" dot in the week strip and the 7px unread dot on the Messages tab. Check marks stay squares in proportion: 28px with a 1.5px 42% outline in checklist rows, 44px in the set table; when done, the square fills white and a 3px black check stroke scales in. Photo slots use a dashed 42% border on a 3:4 aspect.

Line icons are authored in-file as 24-viewBox SVGs with 1.75px stroke, round caps and joins, 22px in the bottom bar; chevrons at 20px with a 2px stroke. No icon fonts, no emoji, no glyph characters as icons.

## Components

### Buttons
Confident, softly rounded, full width by default.
- **Shape:** 10px radius, 50px tall, 1px white border on both main variants.
- **Primary:** White fill, black text, 600 weight at 15px, `0 20px` padding, full width. One per screen area ("Finish workout", "Keep going", "Send"). Inside an inverted sheet it flips to black fill, white text.
- **Secondary:** Transparent fill, white text, same white 1px border. Paired next to a primary in a 10px-gap `btn-row`.
- **Small:** 40px tall, auto width, `0 14px`, 14px text, for inline actions ("Got it").
- **Text:** No box; 14px, 500 weight, Secondary Grey, underlined with the strong hairline at a 4px offset ("Same as last time", "Add a set", "Back to today"). Red variant for destructive text.
- **States:** Disabled at 40% opacity. Focus-visible is a 2px white outline at 2px offset. There is no hover state; this is a touch surface.

### Inputs / Fields
- **Style:** Field Black fill, 1px hairline border, 10px radius, `12px 14px` padding, 15px inherited type, white caret, Tertiary Grey placeholder. Native appearance removed; selects carry an inline 16px grey chevron on the right. Number spinners hidden.
- **Row input:** 118px wide, 46px tall, right-aligned 16px text with a grey unit label beside it (weight, steps).
- **Set input:** 44px tall, centered 16px text, in the set-table grid.
- **Focus:** Border turns white. No glow.
- **Labels:** 13px, 500, Secondary Grey, 6px above the field.
- **Segments / Tabs:** Flex row of equal buttons, 46px (segment) or 42px (tab), Field Black with hairline border, Secondary Grey text; selected flips to white fill, black text.

### Checklist Row
The signature component. A full-width button, 62px minimum, 14px gap, hairline bottom border. Left: a 16px/600 label with a 13px Tertiary Grey sub-line. Right: a 28px check square (or a row input, or a 20px chevron for rows that open a screen). Done rows soften the label to Secondary Grey at 500 and fill the square. Tapping flashes Pressed Black.

### Done Mark
A square that fills white with a black 3px check. Identical in behaviour at 28px (Today rows), 44px (set checks on Train) and as the inverted current-day cell in the week strip. A pending set check shows a white border at 50% opacity while saving. Transition 150ms on the custom ease.

**Day ring.** The day's progress drawn as the checklist it is: a 108px SVG ring beside the date on Today, one segment per row in row order, 16%-white at rest and white once that row is ticked (300ms stroke transition), with the count inside in the display face ("4" at 30px, "/12" at 15px Secondary Grey) over a 11.5px tracked "DONE". With every row ticked the ring reads as a solid white circle and the inverted Day done card appears below the list. It carries `role="img"` with the count as its label. It is the only ring in the system; no other progress is drawn circular.

### Week Strip
7 equal columns, 4px gap. Each day: 11.5px tracked weekday letter, a 21px display-face number, and a 5px dot that appears when the day has logs. Today is inverted white; a selected non-today day gets a 1px white border; future days drop to Tertiary Grey. Beneath it, a 4px progress bar on the hairline track fills white by `scaleX` over 400ms.

### Done Card / Sheets / Toast
- **Done card:** White block, black text, `24px 20px`, "Day done" in the display face at 48px with a 15px `#333` line under it.
- **Sheet:** Rises 20px with a 200ms fade on the custom ease, black with a 42% white top edge, `26px 20px` padding, 40px display title, 64px display number. The **inverted** variant (new personal best) is white with black text and a black primary button.
- **Toast:** White on black, 14px/600, `12px 16px`, fixed 16px above the nav, with an underlined bold "Undo" button when the action is reversible. Same rise animation.
- **Notice:** Outlined box with the strong hairline, `14px 16px`, 14px copy and a text button on the right; the late variant swaps the border to Late Red.

### Tag
Inline 11.5px/700 uppercase at 0.1em, `3px 6px`, white on black ("PR" beside a value). Red variant on Late Red with black text.

### Messages
Bubbles at 82% max width, `11px 14px`, 15px, 16px radius with a 4px corner on the tail side. Coach bubbles are Field Black left-aligned; client bubbles are white on black right-aligned. Day separators are 12px uppercase Tertiary Grey. The composer is pinned above the nav with a 48px input, a 48px "Suggest" toggle (strong hairline outline; inverted when on) and a 48px primary Send.

### Navigation
Fixed 62px bottom bar on black with a hairline top edge; five equal items (Today, Train, Plan, Progress, Messages), each a 22px line icon over a 12px label at 0.03em. Inactive items are Tertiary Grey; the current item is white (`aria-current="page"`). A 7px white dot marks unread messages. No fill, no indicator bar.

## Do's and Don'ts

### Do:
- **Do** use white fill with black text for every completed or selected state (check, segment, today cell, client bubble, done card, toast).
- **Do** separate rows and sections with 1px hairlines at 12% white; outline interactive squares at 42% white.
- **Do** set screen titles and big numbers in Big Shoulders Display at 800, uppercase, line-height 0.92; keep everything else in the system sans.
- **Do** name a section with one 12px, 600, 0.14em uppercase eyebrow in Secondary Grey.
- **Do** keep tap targets at 44px or larger: 62px rows, 44px set checks, 50px buttons, 46px segments.
- **Do** use authored 24-viewBox line icons with 1.75px round strokes; inline them as SVG.
- **Do** say it saved: a white toast with Undo where the action can be reversed.

### Don't:
- **Don't** add an accent colour. Lime was removed; red is for "late" only.
- **Don't** invent a radius. Use the scale (4 / 6 / 10 / 16 px, pill for the toast) and nothing larger than 16px.
- **Don't** use shadows, glows, gradients or blurred backdrops; depth is black, Field Black and inversion.
- **Don't** box content in cards or nest cards; use hairlines and whitespace.
- **Don't** set the display face on buttons, labels, body text or inputs.
- **Don't** use emoji or glyph characters as icons.
- **Don't** add a hover state; this is a touch surface, and `:active` and focus-visible are the only pointer feedback.
