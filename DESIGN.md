---
name: Rebuilt by Ryan
description: True-black, type-only coaching app where today is a checklist that fills white; one world across the client phone app and the coach's desktop board.
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
  display-desktop:
    fontFamily: "'Big Shoulders Display', 'Arial Narrow', Impact, sans-serif"
    fontSize: "34px"
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
  wordmark:
    fontFamily: "'Big Shoulders Display', 'Arial Narrow', Impact, sans-serif"
    fontSize: "22px"
    fontWeight: 800
    lineHeight: 1
    letterSpacing: "0.01em"
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
  body-desktop:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: 1.5
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
  caption:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "11.5px"
    fontWeight: 600
    letterSpacing: "0.1em"
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
  page-y: "28px"
  page-x: "36px"
  cols-gap: "40px"
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
  button-desktop:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    typography: "{typography.body-desktop}"
    rounded: "{rounded.md}"
    padding: "0 16px"
    height: "40px"
  button-desktop-primary:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.md}"
    padding: "0 16px"
    height: "40px"
  button-desktop-small:
    rounded: "{rounded.md}"
    padding: "0 12px"
    height: "34px"
  button-text:
    backgroundColor: "transparent"
    textColor: "{colors.ink-secondary}"
    rounded: "{rounded.none}"
    padding: "0"
  icon-button:
    backgroundColor: "transparent"
    textColor: "{colors.ink-tertiary}"
    rounded: "{rounded.sm}"
    size: "30px"
  input:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink}"
    rounded: "{rounded.md}"
    padding: "12px 14px"
  input-focus:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink}"
  input-desktop:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink}"
    typography: "{typography.body-desktop}"
    rounded: "{rounded.md}"
    padding: "9px 12px"
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
  row-desktop:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    rounded: "{rounded.none}"
    padding: "11px 0"
    height: "58px"
  row-desktop-hover:
    backgroundColor: "{colors.ground-pressed}"
  check-mark:
    backgroundColor: "transparent"
    rounded: "{rounded.sm}"
    size: "28px"
  check-mark-done:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.sm}"
    size: "28px"
  check-mark-desktop:
    backgroundColor: "transparent"
    rounded: "{rounded.sm}"
    size: "26px"
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
  client-ring:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    rounded: "{rounded.pill}"
    size: "112px"
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
  notice-done:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.lg}"
    padding: "13px 16px"
  notice-late:
    backgroundColor: "transparent"
    textColor: "{colors.late-red}"
    rounded: "{rounded.lg}"
    padding: "13px 16px"
  tag:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.xs}"
    padding: "3px 6px"
  tag-red:
    backgroundColor: "{colors.late-red}"
    textColor: "{colors.ground}"
    rounded: "{rounded.xs}"
    padding: "3px 6px"
  badge:
    backgroundColor: "transparent"
    textColor: "{colors.ink-secondary}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
  badge-overdue:
    backgroundColor: "transparent"
    textColor: "{colors.late-red}"
    rounded: "{rounded.sm}"
    padding: "2px 8px"
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
  modal:
    backgroundColor: "{colors.ground}"
    textColor: "{colors.ink}"
    rounded: "{rounded.lg}"
    padding: "20px 22px"
    width: "520px"
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
  bubble-own-desktop:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    typography: "{typography.body-desktop}"
    rounded: "{rounded.lg}"
    padding: "10px 14px"
  bubble-other-desktop:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink}"
    typography: "{typography.body-desktop}"
    rounded: "{rounded.lg}"
    padding: "10px 14px"
  nav-bar:
    backgroundColor: "{colors.ground}"
    textColor: "{colors.ink-tertiary}"
    rounded: "{rounded.none}"
    height: "62px"
  nav-item-current:
    textColor: "{colors.ink}"
  sidebar:
    backgroundColor: "{colors.ground}"
    textColor: "{colors.ink-tertiary}"
    rounded: "{rounded.none}"
    padding: "10px"
    width: "232px"
  sidebar-item:
    backgroundColor: "transparent"
    textColor: "{colors.ink-tertiary}"
    typography: "{typography.body-desktop}"
    rounded: "{rounded.md}"
    padding: "10px 12px"
  sidebar-item-hover:
    backgroundColor: "{colors.ground-pressed}"
    textColor: "{colors.ink}"
  sidebar-item-active:
    backgroundColor: "{colors.ground-field}"
    textColor: "{colors.ink}"
  nav-badge:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.ground}"
    rounded: "{rounded.pill}"
    padding: "1px 7px"
  nav-badge-late:
    backgroundColor: "{colors.late-red}"
    textColor: "{colors.ground}"
    rounded: "{rounded.pill}"
    padding: "1px 7px"
---

# Design System: Rebuilt by Ryan

<!-- Scope: one world, two surfaces. Extracted from client.html (the client PWA, phone, touch) and index.html (the coach dashboard, desktop, pointer). Where a value differs between them it is the same rule at a different density; both are recorded. -->

## Overview

**Creative North Star: "The Gym Chalkboard"**

A black surface, white chalk, and nothing else. Both surfaces are pure type on true black: no imagery, no colour, no gradient, no shadow; corners are softly rounded on a small scale so the black reads friendly rather than severe. The only things that are white at full strength are the words that matter right now and the marks that say something got done. Everything secondary steps down through two greys. On the client app the coach's words sit in the largest body size on the screen and the client's day is a vertical list of rows separated by hairlines, each ending in a square that fills white when ticked. On the coach dashboard the same rows list the roster, sorted by who needs him, and the same ring counts clients instead of tasks.

Density has two steps. The client app is phone-first and one-handed: a single 560px column with 20px gutters, 62px tap rows, 44px set checks, 50px buttons, and a fixed 62px bottom bar. The coach dashboard is desktop and pointer-driven: a 232px sidebar, a 14px base body, 58px rows, 40px buttons, 28px by 36px page padding and a two-column Today. The condensed display face (Big Shoulders Display at 800) is reserved for screen titles and big numbers on both; it is what makes a date, a count, or a personal best read like a poster rather than a form. The system sans does all the reading.

State is expressed by inversion. A done check, a selected segment, the current day in the week strip, the sender's own message bubble, the toast, the "Day done" card, the PR sheet and the done notice all flip to white-on-black. The one colour, a warm red, appears only when something is late or overdue. The previous lime accent was removed by decision and nothing replaced it.

**Key Characteristics:**
- True black ground (`#000`) with white text and two greys; no tonal surfaces apart from a near-black field fill for inputs, the active sidebar item and the other party's bubble
- One condensed display face at weight 800, uppercase, for titles, the wordmark and numbers only
- Rounded corners on one small scale: 4px tags, 6px checks, set cells and badges, 10px inputs, buttons, chips, sidebar items and the today cell, 16px cards, sheets, modals, notices and bubbles, a pill for toasts and count badges
- Hairline dividers (12% white) carry structure; a card is a hairline on top, never a box
- Done means inverted: white square, black check, the same mark on Today, Train, the week strip and the coach's roster
- Red (`#ff5a5a`) is a status, not an accent, and it means "late" or "overdue"
- Two densities, one system: 15px/62px/50px on the phone, 14px/58px/40px on the desktop

## Colors

A monochrome system: black ground, white ink, two grey steps for secondary and tertiary text, two alpha hairlines for structure, one red for lateness. The same ten tokens on both surfaces.

### Primary
- **Chalk White** (`{colors.ink}`): Primary text, the filled primary button, the done check, the current day in the week strip, selected segments, the sender's own message bubble, toasts, the "Day done" card, the done notice, the inverted PR sheet, the sidebar count badge, the active tab underline and the filled segments of a ring. White is the active and the completed state.

### Neutral
- **True Black** (`{colors.ground}`): The ground of every screen, the bottom bar, the sidebar, sheets, modals, and the text colour on anything inverted.
- **Pressed Black** (`{colors.ground-pressed}`): The `:active` flash on a tapped checklist row and the fill of a read-only set value cell on the phone; the hover fill of rows, table rows, message-list items and sidebar items on the desktop.
- **Field Black** (`{colors.ground-field}`): The fill of inputs, selects, textareas, segment buttons, the other party's message bubble, avatars, photo slots and skeletons. On the desktop it is also the active sidebar item, the selected message-list item and the hover fill of ghost buttons, icon buttons and the modal close. It is the one step above the ground, and it is never used as a card.
- **Secondary Grey** (`{colors.ink-secondary}`): Eyebrows, the brand line, subtitles, done-row labels, field labels, text buttons, the unit suffix on a big number, logged days in the week strip, chart titles and breadcrumb links.
- **Tertiary Grey** (`{colors.ink-tertiary}`): Row sub-lines, placeholders, column headers, timestamps, future days, inactive nav items (bottom bar and sidebar), chevrons, icon buttons at rest, the sidebar "Coach" line and footer, the "Coach sign-in" line and chart axis text. The quietest text that still passes on black.
- **Hairline** (`{colors.hairline}`): Every divider: row bottoms, section rules, the nav top, the sidebar's right edge, card tops, table rules, modal and message-pane headers, input borders at rest; at 16% it is the unfilled segment of a ring and at 8% the chart grid.
- **Strong Hairline** (`{colors.hairline-strong}`): The border of an unticked check square (1.5px), a sheet's top edge, a modal's border, a notice box, the badge outline, ghost and danger button borders, the "Suggest" toggle, dashed photo-slot borders, the scrollbar thumb and the underline colour on text buttons.
- **Inverted Secondary** (`{colors.inverted-ink-secondary}`): Secondary text inside the inverted sheet (eyebrow, subtitle, muted).

### Tertiary
- **Late Red** (`{colors.late-red}`): Only for late or overdue. On the phone: the border of the late check-in notice, the "Late" word in a row sub-line, the red tag. On the desktop: the sidebar's late count badge, the red tag on a roster row, the overdue badge, the late notice, the "This week's is late" line, and the border and text of a payment status select set to Overdue. Never a button fill, never decoration, never a chart colour.

**Legacy aliases.** `index.html` still declares the old role names from the lime era (`--accent`, `--adim`, `--blue`, `--bdim`, `--amber`, `--ambdim`, `--green`, `--gdim`, `--bg4`, `--rdim`, `--rl`). They are aliases, not colours: `--accent`, `--blue` and `--green` resolve to white, `--amber` to Secondary Grey, the `-dim` variants to 8–10% white, so the inline styles that still reference them inherit the world. Do not use them in new markup and do not give them a hue; reference the ten tokens above.

### Named Rules
**The One Colour Rule.** There is no accent. The only hue in either app is Late Red, and it appears only when something is late or overdue. A screen with nothing late is black, white and grey.

**The Inversion Rule.** Emphasis and completion are shown by flipping to white-on-black, not by adding colour, weight or glow. If a state needs to be loud, invert it.

## Typography

**Display Font:** Big Shoulders Display, self-hosted at `/fonts/big-shoulders-display.woff2` (variable, weight axis 500–900, latin subset, `font-display: swap`), declared identically in both files, with Arial Narrow and Impact as fallbacks
**Body Font:** System sans stack (`-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`)

**Character:** A compressed, shouted display face against a quiet, invisible body face. The display face is uppercase at weight 800 with a tight 0.92 line height and 0.01em tracking; it is used only where a thing is announced (a date, a count, a screen name, a personal best, the wordmark). The system sans carries every sentence, with tabular numerals on by default so set weights, counts and amounts line up. The base body size is 15px on the phone and 14px on the desktop; 11.5px is the smallest text on either surface.

### Hierarchy
- **Display** (800, 40px, 0.92, uppercase): Phone screen titles ("Sunday Oct 18", "Train", "Progress") and the title line in a sheet; the "Day done" card at 48px. On the desktop, the Today date and the page heads of Clients, Programs, Cardio, Nutrition and Payments (`.page-head h1`), and the sign-in wordmark.
- **Display Desktop** (800, 34px, 0.92, uppercase): The desktop default `h1` (client page name, builder titles) and the stat-strip values.
- **Display Number** (800, 60px, 0.92): The large count in a sheet or PR announcement (64px inside sheets). The count inside a ring is 30px (its "/12" or "/4" at 15px in Secondary Grey), week-strip day numbers 21px, phone stat values 40px, phone macro values 30px, PR values 28px. On the desktop: stat values 34px, macro values 34px with their sub-values at 26px, personal-best numbers 26px. All in the display face; the size steps with the importance of the number.
- **Headline** (800, 30px, 0.92, uppercase): Secondary display title (error screen). The desktop message-list title ("Messages") sits at 28px, line-height 1.
- **Wordmark** (800, 22px, 1, uppercase): "Rebuilt by Ryan" at the top of the sidebar, with a 12px 0.1em "Coach" line in Tertiary Grey under it. On the sign-in screen the wordmark is the `h1` at 40px.
- **Title** (600, 16px, 1.3): Row labels, exercise names (17px), meal names, accordion summaries, modal titles. Desktop row labels are 15px; desktop `h2` is 15px and `h3`, exercise names and tab labels 14px.
- **Body** (400, 15px, 1.45): Phone default text. The coach's note runs at 17px; notice copy and list rows at 14px.
- **Body Desktop** (400, 14px, 1.5): Desktop default text: body, buttons, inputs, table rows, sidebar items, bubbles, the status line under the date.
- **Body Small** (400, 13px): Row sub-lines, prescriptions, field labels (500), timestamps, small buttons (34px), text buttons on the desktop, check-in dates.
- **Label** (600, 12px, 0.14em, uppercase): The eyebrow, which names a section ("From Ryan", "Weekly check-ins · last week", "Needs a reply", "Personal bests") in Secondary Grey. Card titles, stat labels and chart titles on the desktop use the same style. The brand line uses it at 0.16em; set-table and data-table column headers at 0.1em in Tertiary Grey; macro keys at 0.06em; the sidebar's "Coach" line at 0.1em.
- **Caption** (600, 11.5px, 0.1em, uppercase): The smallest text: tags, the "DONE" / "IN" word inside a ring, week-strip weekday letters (0.08em), bubble timestamps (regular, 60% opacity) and chart axis text (regular, Tertiary Grey). Nothing is set below 11.5px.

### Named Rules
**The Announcement Rule.** The display face appears only on screen titles, the wordmark and big numbers. Never on a row label, button, eyebrow, body text, sidebar item or input.

**The Eyebrow Rule.** Sections are named with one 12px uppercase eyebrow at 0.14em tracking in Secondary Grey, then content. No section headings in the body face at larger sizes, and no eyebrow above a display title that already names the page.

**The Floor Rule.** 11.5px is the smallest type on either surface, and only for tags, ring captions, weekday letters, timestamps and chart axes. Nothing readable goes below 13px.

## Layout

**Client app (phone).** One centered column, `max-width: 560px`, with 20px side gutters, 14px plus the safe-area inset at the top, and bottom padding of the nav height (62px) plus 28px plus the safe-area inset so the last row clears the fixed bar. There is no multi-column layout; on desktop the column sits centered on black.

Vertical rhythm is section-based: `section` blocks are separated by 32px (6px when marked tight), an eyebrow sits 10px above its content, and stacked items are 10px apart. Rows are flush to the column edges, full width, with a 62px minimum height and 12px vertical padding. Grids are used only for data: the 7-column week strip (4px gap), the set table (`30px 1fr 1fr 76px 44px`, 8px gap), two-column stats and 4-column macros (12px / 8px gaps), and 3-column photo grids (8px gap).

Fixed chrome: a bottom bar (62px plus safe-area), a message composer pinned above the bar, bottom sheets that rise from the bottom edge, and a toast centered 16px above the bar.

**Coach dashboard (desktop, 1280 and up).** A full-height flex shell: a 232px sidebar (`--sb`) on the left with a hairline right edge, then a main column that scrolls per page. Pages are padded `28px 36px 40px`. The sidebar stacks the wordmark block (`22px 18px 18px`, hairline below), the nav (10px padding, items `10px 12px` with a 12px icon gap and 2px between items), and a footer (`12px 18px`, hairline above) with the connection dot and "Sign out".

Today is two columns: `minmax(0, 1.5fr) minmax(300px, 1fr)` with a 40px gap, the roster on the left and "Needs a reply" / "This week's wins" on the right; the page header is a flex row with the date on the left and the 112px ring on the right, 24px below. Section blocks are 32px apart with the eyebrow 10px above content, the same rhythm as the phone. Rows are 58px minimum with 11px vertical padding and a 14px gap. Card grids (`.card-grid`) are 14px apart in 2, 3, 4 or auto-fill (270px minimum) columns; the stat strip sets its gap to `0 28px`. Forms use two- and three-column grids (16px / 12px column gaps, 14px between fields). Messages split into a 264px list (hairline right edge) and the thread; the composer is a hairline-topped row with a 44px input. Modals are centered at 520px (720px wide variant), 90vh max, with a sticky `16px 22px` header and `20px 22px` body.

### Named Rules
**The Two Densities Rule.** The phone and the desktop share every token and differ only in density: 15/62/50/44 on the phone (body, row, button, set check) becomes 14/58/40/26 on the desktop (body, row, button, check square). Do not invent a third step.

## Elevation & Depth

No shadows anywhere, on either surface. Depth is flat and tonal: the ground is `#000`, input fields, the other party's bubble, the active sidebar item and the selected message-list item sit one step up at `#191919`, and a pressed or hovered row flashes `#0f0f0f`. Overlays dim the screen with 65% black (sheets), 70% black (modals) or 96% black (lightbox). Structure is carried entirely by 1px hairlines at 12% white and stronger outlines at 42% white (1.5px on check squares, 1px on sheets, modals, badges and ghost buttons). Inversion (white block on black) is the only way a surface comes forward.

### Named Rules
**The No-Card Rule.** Content is not boxed. Rows and sections are separated by hairlines; a "card" on the desktop (`.card`, `.workout-card`, `.meal-card`, `.macro-card`, `.chart-box`) is a hairline on its top edge and nothing else: no border box, no fill, no radius. The stat strip is a single hairline above and below the row of numbers, not four boxes. The only filled white blocks are state announcements (done card, PR sheet, toast, done notice). The only outlined boxes are the notice and the modal, and the notice is reserved for a message that needs attention.

## Shapes

Rounded, lightly. One radius scale, held in `--r-sm` (6px), `--r` (10px) and `--r-lg` (16px) in both files: 4px on tags; 6px on check squares, set-table cells, badges, icon buttons and the modal close; 10px on buttons, inputs, segments, tabs, sidebar items, the week strip's today cell, the phone notice and photo tiles; 16px on the Day done card, the desktop notice, modals, the top corners of sheets, and message bubbles (4px on the tail corner so the side is readable); a full pill (999px) on the toast, the sidebar count badges and the scrollbar thumb. The only circles are the rings (108px on Today, 112px on the dashboard, a 9-unit stroke on a 100-unit viewBox, one segment per row or client with 4° gaps), avatars, the 5–6px "logged" and "connected" dots, the 7px unread dot on the Messages tab, chart points (4px radius, black fill, 2px stroke) and the 28px spinner. Check marks stay squares in proportion: 28px with a 1.5px 42% outline in phone checklist rows, 44px in the set table, 26px on desktop roster rows; when done, the square fills white and a 3px black check stroke appears. Photo slots use a dashed 42% border on a 3:4 aspect.

Line icons are authored in-file as 24-viewBox SVGs (the `ICON` map in `index.html`; inline markup in `client.html`) with 1.75px stroke, round caps and joins, 22px in the bottom bar and the sidebar; chevrons at 20px with a 2px stroke; icon-button and modal-close glyphs at 16–18px with a 2px stroke. Charts are drawn on canvas as a 2px line with 4px points on black, an 8% grid, 11.5px Tertiary Grey axis text, and no fills under the line. No icon fonts, no emoji, no glyph characters as icons.

## Components

### Buttons
Confident, softly rounded, full width by default on the phone, auto width on the desktop.
- **Shape:** 10px radius, 1px white border on both main variants. 50px tall at 15px/600 with `0 20px` padding on the phone; 40px tall at 14px/600 with `0 16px` on the desktop (`.btn`); 34px at 13px with `0 12px` for the desktop small variant (`.btn-sm`); 40px at 14px with `0 14px` for the phone small variant.
- **Primary:** White fill, black text. One per screen area ("Finish workout", "Keep going", "Send", "New invoice", "Sign in"). Inside an inverted sheet it flips to black fill, white text. Desktop hover drops opacity to 90%.
- **Secondary:** Transparent fill, white text, same white 1px border. Paired next to a primary in a 10px-gap `btn-row`. The desktop **ghost** and **danger** variants use the 42% strong hairline instead; ghost fills Field Black on hover, danger is Secondary Grey text that turns white on hover.
- **Text:** No box; 14px (13px on the desktop), 500 weight, Secondary Grey, underlined with the strong hairline at a 4px offset ("Same as last time", "Add a set", "Back to today", "Sign out"). Red variant for destructive text. Breadcrumb links use the same treatment and turn white on hover.
- **Icon:** 30px square, 6px radius, Tertiary Grey line icon at 16px; hover turns it white on Field Black.
- **States:** Disabled at 40% opacity. Focus-visible is a 2px white outline at 2px offset. The phone has no hover state (touch surface; `:active` and focus-visible only). The desktop has hover on every pointer target, always as a tonal step or a brightening, never a colour.

### Inputs / Fields
- **Style:** Field Black fill, 1px hairline border, 10px radius, white caret, Tertiary Grey placeholder. `12px 14px` padding at 15px on the phone; `9px 12px` at 14px on the desktop. Native appearance removed; selects carry an inline 16px grey chevron on the right. Number spinners hidden. Textareas resize vertically, 72px minimum.
- **Row input:** 118px wide, 46px tall, right-aligned 16px text with a grey unit label beside it (weight, steps).
- **Set input:** 44px tall, centered 16px text, in the set-table grid.
- **Status select (desktop):** An inline select at 12px with `4px 26px 4px 8px` padding; when its value is Overdue the border and text go Late Red.
- **Focus:** Border turns white. No glow.
- **Labels:** 13px, 500, Secondary Grey, 6px above the field.
- **Segments / Tabs:** On the phone, a flex row of equal buttons, 46px (segment) or 42px (tab), Field Black with hairline border, Secondary Grey text; selected flips to white fill, black text. On the desktop, tabs are a hairline-bottomed row of `10px 14px` text buttons in Tertiary Grey; the active tab is white at 600 with a 2px white underline.

### Checklist Row
The signature component on both surfaces. A full-width button with a hairline bottom border. Phone: 62px minimum, 14px gap, a 16px/600 label with a 13px Tertiary Grey sub-line, and on the right a 28px check square (or a row input, or a 20px chevron for rows that open a screen). Desktop (`.rows` / `.row`): 58px minimum, 11px vertical padding, 14px gap, a 15px/600 label with a 13px sub-line that truncates with an ellipsis, an avatar on the left, and on the right a tag group, a 26px check square and a small "Message" button. Done rows soften the label to Secondary Grey at 500 and fill the square. Tapping flashes Pressed Black on the phone; hovering fills Pressed Black on the desktop.

### Done Mark
A square that fills white with a black 3px check. Identical in behaviour at 28px (Today rows), 44px (set checks on Train), 26px (roster rows on the dashboard) and as the inverted current-day cell in the week strip. A pending set check shows a white border at 50% opacity while saving. Transition 150ms on the custom ease.

**Ring.** Progress drawn as the list it is: an SVG ring with one segment per row (108px beside the date on Today) or per active client (112px in the dashboard header), 16%-white at rest and white once that row is ticked or that client has checked in (300ms stroke transition), with the count inside in the display face ("4" at 30px, "/12" at 15px Secondary Grey) over an 11.5px tracked "DONE" or "IN". With every segment filled the ring reads as a solid white circle. It carries `role="img"` with the count as its label. No other progress is drawn circular.

### Week Strip
7 equal columns, 4px gap (440px maximum on the desktop). Each day: 11.5px tracked weekday letter, a 21px display-face number, and a 5px dot that appears when the day has logs. Today is inverted white; a selected non-today day gets a 1px white border; future days drop to Tertiary Grey. On the phone a 4px progress bar on the hairline track fills white by `scaleX` over 400ms beneath it.

### Stat Strip (desktop)
A row of numbers, not boxes: the card grid that holds stat cards gets a hairline above and below and a `0 28px` gap; each stat is a 12px eyebrow label, a 34px display value in white, and an optional 12px Tertiary Grey sub-line, padded `16px 0`. Macro cards follow the same pattern with a 34px value and a row of hairline-topped 26px sub-values with 12px 0.06em keys.

### Done Card / Sheets / Modal / Toast / Notice
- **Done card:** White block, black text, `24px 20px`, "Day done" in the display face at 48px with a 15px `#333` line under it.
- **Sheet (phone):** Rises 20px with a 200ms fade on the custom ease, black with a 42% white top edge, `26px 20px` padding, 40px display title, 64px display number. The **inverted** variant (new personal best) is white with black text and a black primary button.
- **Modal (desktop):** Centered on a 70% black scrim, black with a 1px strong-hairline border and 16px radius, 520px wide (720px for builders), rising 16px over 200ms. Sticky hairline-bottomed header with a 16px/600 title and a 32px close button; `20px 22px` body.
- **Toast:** White on black, 14px/600, `12px 16px`, pill radius, with an underlined bold "Undo" button when the action is reversible. Fixed 16px above the nav on the phone, 24px above the bottom edge centered on the desktop. Same rise animation.
- **Notice:** Phone: an outlined box with the strong hairline, 10px radius, `14px 16px`, 14px copy and a text button on the right; the late variant swaps the border to Late Red. Desktop: 16px radius, `13px 16px`, 15px/600 copy; the **done** variant is inverted white-on-black ("Logged. Nice."), the **late** variant is a Late Red 1px outline with Late Red text.

### Tag / Badge
- **Tag:** Inline 11.5px/700 uppercase at 0.1em, `3px 6px`, 4px radius, white on black ("PR" beside a value, "Idea" on a suggestion, "Drive 1/5" on a roster row). Red variant on Late Red with black text ("Late").
- **Badge (desktop):** Inline 12px/600, `2px 8px`, 6px radius, transparent with a strong-hairline outline and Secondary Grey text; active/paid variants outline and text in white; the overdue variant outlines and reads in Late Red.
- **Sidebar count badge:** Pill, 12px/700, `1px 7px`, 22px minimum width, white on black for unread or pending counts; Late Red when the count is late check-ins.

### Messages
Bubbles at `11px 14px` (phone, 82% max width, 15px) or `10px 14px` (desktop, 70% max width, 14px), 16px radius with a 4px corner on the tail side, 8px apart, and an 11.5px timestamp at 60% opacity. The sender's own bubble is white on black, right-aligned; the other party's is Field Black, left-aligned (so the coach's bubble is Field Black on the client app and white on the dashboard). Day separators are 12px uppercase Tertiary Grey. Phone composer: pinned above the nav with a 48px input, a 48px "Suggest" toggle (strong hairline outline; inverted when on) and a 48px primary Send. Desktop: a 264px list with a 28px display "Messages" title, hairline-separated `12px 16px` client rows (Pressed Black on hover, Field Black when selected, unread first), and a hairline-topped composer with a 44px input.

### Data Table (desktop)
A hairline-ruled list, not a grid with borders: a `.table-head` of 12px 0.1em Tertiary Grey column labels between two hairlines, then `.table-row` rows at `12px 0`, 14px, hairline-bottomed, Pressed Black on hover. Column widths are set per table in the grid template (Payments: `1.2fr 1.5fr 110px 100px 160px`).

### Navigation
- **Bottom bar (phone):** Fixed 62px on black with a hairline top edge; five equal items (Today, Train, Plan, Progress, Messages), each a 22px line icon over a 12px label at 0.03em. Inactive items are Tertiary Grey; the current item is white (`aria-current="page"`). A 7px white dot marks unread messages. No fill, no indicator bar.
- **Sidebar (desktop):** 232px, full height, black with a hairline right edge. Wordmark block on top, then seven items (Today, Clients, Programs, Cardio, Nutrition, Messages, Payments), each a 22px line icon, a 14px label and an optional pill count badge, `10px 12px` with a 10px radius. Items are Tertiary Grey; hover is Pressed Black with white text; the active item is Field Black with white 600 text. Footer: a 6px connection dot ("Connected", Tertiary Grey when offline) and a 12px "Sign out" text button.

### Sign-in (desktop)
A full-height centered column on black: the wordmark as the `h1` at 40px ("Rebuilt / by Ryan"), "Coach sign-in" as a 13px Tertiary Grey line, then a 340px form of two labelled fields 12px apart, a 13px error line (`role="alert"`) and a full-width white-filled primary "Sign in" button.

## Do's and Don'ts

### Do:
- **Do** use white fill with black text for every completed or selected state (check, segment, today cell, own bubble, done card, done notice, toast, active tab underline).
- **Do** separate rows and sections with 1px hairlines at 12% white; outline interactive squares at 42% white.
- **Do** set screen titles, the wordmark and big numbers in Big Shoulders Display at 800, uppercase, line-height 0.92; keep everything else in the system sans.
- **Do** name a section with one 12px, 600, 0.14em uppercase eyebrow in Secondary Grey.
- **Do** keep phone tap targets at 44px or larger: 62px rows, 44px set checks, 50px buttons, 46px segments. On the desktop, 58px rows, 40px buttons, 34px small buttons, 30px icon buttons.
- **Do** use authored 24-viewBox line icons with 1.75px round strokes; inline them as SVG.
- **Do** say it saved: a white toast with Undo where the action can be reversed.
- **Do** draw progress as a segmented ring, one segment per row or per client, and nothing else circular.
- **Do** give every desktop pointer target a hover, as a tonal step (Pressed Black, Field Black) or a brightening (white text, white top rule), never a colour.

### Don't:
- **Don't** add an accent colour. Lime was removed; red is for "late" and "overdue" only, and the legacy alias variables resolve to white and grey.
- **Don't** invent a radius. Use the scale (4 / 6 / 10 / 16 px, pill for toasts and count badges) and nothing larger than 16px.
- **Don't** use shadows, glows, gradients or blurred backdrops; depth is black, Field Black and inversion.
- **Don't** box content in cards or nest cards; a card is a hairline on top, and the stat strip is one rule above and one below.
- **Don't** set the display face on buttons, labels, body text, sidebar items or inputs.
- **Don't** use emoji or glyph characters as icons.
- **Don't** add a hover state on the client app; it is a touch surface, and `:active` and focus-visible are the only pointer feedback there. Hover belongs to the desktop dashboard only.
- **Don't** set text below 11.5px, or put a kicker above a display title that already names the page.
