# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

**Clients** of one personal trainer, Ryan "Rundy" Rundhawa. Each client opens the app on their phone from a private link (no password) and is expected to log their own day, every day, without help. Undecided: the client mix (everyday people getting fit vs experienced lifters vs competition prep), age range, online vs in-person split, and whether logging happens in the gym between sets or at home afterwards. Until confirmed, design beginner-first: assume nothing, and keep the faster paths out of the way rather than absent.

**The coach** (Ryan), the single admin. Opens the dashboard daily to review daily check-ins, and on Sunday evening or Monday morning to review weekly check-ins. His first question on opening it is "check-ins": who has and hasn't checked in.

## Product Purpose

A coaching portal where the coach builds each client's program, meal plan, cardio and supplements, and the client logs their own adherence and progress so the coach can review it without chasing. Success for a client: they log their day in under a minute, can see they are getting stronger, and get told when they miss something. Success for the coach: at a glance, who checked in, who didn't, and who needs a message.

## Positioning

Not a generic workout tracker: everything a client sees was written for them by their coach (program, meal plan, supplements, a personal note), and everything they log goes straight back to that coach. The relationship is the product. The app should feel like Ryan's, not like a template.

## Operating Context

- Clients log on a phone; the app is a PWA added to the iPhone home screen (the install card and token-in-localStorage login must keep working).
- Daily rhythm (client): log the workout as it happens (every set), morning weight, a short daily questionnaire, steps, water, supplements taken, meal plan followed.
- Weekly rhythm (client): weekly check-in (weight, body fat, waist, energy, sleep, win of the week, what to improve) and progress photos (front, side, back).
- Coach rhythm: reviews daily check-ins daily; weekly check-ins Sunday evening or Monday morning. A weekly check-in not submitted by Monday is late and the coach wants an alert for it.
- What the coach actually reads when checking on a client: morning weight, win of the week, what to improve, steps, progress photos.
- When a client misses days, the app should nudge the client first; the coach messages second.
- Everyone is in lbs. (Database columns are named `weight_kg` but hold the number the client typed in lbs; never convert existing rows.)

## Capabilities and Constraints

- Existing: client link login (`client.html?t=<token>`), coach dashboard with no login (security fix is a separate, later task), program → workouts → exercises, exercise logs, meal plans, macros, supplements, cardio protocols, daily logs, daily steps, checklist completions, weekly check-ins, progress photos (private storage bucket), messages (polled), payments.
- Confirmed daily (D): workout sets, morning weight, daily questions (rested / desire to train / digestive issues / untracked food), steps, water, supplements ticks, meal-plan tick. Confirmed weekly (W): weekly check-in, progress photos.
- Workout logging must record **every set**: weight × reps per set, plus an **RPE** (effort) rating. The current `exercise_logs` row holds one weight and a free-text reps string per exercise per day, so per-set logging needs a schema change (e.g. one row per set with a set number and RPE); it must run on both the test and live databases, and the coach dashboard must read both old and new shapes.
- Remove skinfolds and blood pressure from the weekly check-in (not needed).
- Clients must see their personal bests and their strength progress over time, and be told when they set a PR.
- Clients should be told when they are missing something (a day not logged, a weekly check-in due). Mechanism undecided: in-app nudges on open are available now; real push notifications need a push service and are a later decision.
- Daily goals ("goal bubbles") reset each day, are the first thing visible on opening the app, and show clearly when checked off.
- A place for clients to suggest features to the coach.
- Technical: two single-file HTML pages, no framework, no build step, Supabase REST via `fetch` with the public anon key; deployed on Netlify from the repo. Keep it that way unless the user decides otherwise.
- Terminology: the coach has no required or forbidden words; current terms (check-in, program, phase, cardio protocol, supplements, macros) are fine.

## Brand Commitments

- Name on screen: **"Rebuilt by Ryan"** (coach wrote "Rebuily by Ryan"; spelling to be confirmed). Replaces "Elite Coach", "My Coaching" and "Rundy" wherever they appear.
- The lightning-bolt icon is a placeholder, not a logo. There is no logo yet; design for a wordmark.
- No photography is available for now; do not design around imagery that does not exist.

## Evidence on Hand

- Real program structure, exercise names, meal plans and check-in fields exist in the live database (not in the repo). The repo has schema only; a test database with made-up clients is used for development.
- No testimonials, before/after photos, or client numbers to show; nothing may be invented.

## Product Principles

1. **Today first.** Every client visit starts with what to do today and what is already done; everything else is one tap away.
2. **Logging never costs the client.** A tap that saves something must never lose something else, and it must say it saved.
3. **The coach is present.** His note, his plan, his reply are the content; the app is the frame.
4. **Show the client they're winning.** Personal bests and strength trends are visible without asking, in plain numbers.
5. **Nudge before the coach has to.** The app tells the client what's missing; the coach's time goes to coaching.

## Accessibility & Inclusion

Phone use one-handed, sometimes mid-workout: large tap targets, readable contrast on a dark screen, and no action that depends on precision. No further standard has been set.
