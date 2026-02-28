# 🎮 SwipeColor – Production Plan (Flutter)

## 1️⃣ Game Vision

**SwipeColor**
Player draws **one continuous line** to connect all dots on the screen **without lifting finger**.

If player:

* Lifts finger before finishing → ❌ Fail
* Misses a dot → ❌ Fail
* Connects all in one stroke → ✅ Win

Clean. Smart. Satisfying.

---

# 2️⃣ Core Gameplay Rules

* Dots are placed on screen.
* Player must start from the correct starting dot.
* Finger must stay on screen.
* Each dot must be touched in correct order.
* Line cannot break.
* When last dot is connected → Level Complete.

---

# 3️⃣ MVP Scope (Production Ready but Lean)

We will include:

✅ Level system
✅ Welcome screen
✅ Level select
✅ Progress saving
✅ Basic animations
✅ Sound + haptic
✅ Clean UI
✅ Difficulty progression

We will NOT include:

* Online multiplayer
* Level editor (v1)
* Themes/skins (v2)

---

# 4️⃣ Core Screens

## 🏠 Home Screen

Show:

* Game title: SwipeColor
* Current Level
* Total Stars
* Play Button
* Level Select Button
* Settings Button

---

## 🗂 Level Select Screen

* Grid of levels
* Locked/unlocked system
* Show stars per level (0–3)

---

## 🎮 Game Screen

Show:

* Dots
* Drawn line
* Pause button
* Level number
* Star progress (optional)

---

## ⏸ Pause Screen

* Resume
* Restart
* Back to Home

---

## 🏆 Level Complete Screen

* Time taken
* Stars earned
* Next Level
* Replay
* Back to Menu

---

# 5️⃣ Game Mechanics (Core Logic)

### Dot Structure

Each dot has:

* id
* position (x, y)
* order number
* radius
* isConnected (bool)

---

### Drawing Logic

When finger touches screen:

* Start tracking path
* If first dot touched → start
* If wrong start → fail

While dragging:

* Draw line visually
* Check collision with next required dot
* Mark dot as connected
* Move to next

If finger lifts before final dot:
→ Fail

If all dots connected:
→ Win

---

# 6️⃣ Difficulty System

We scale difficulty by:

Level 1–5:

* 3–4 dots
* Simple layout

Level 6–15:

* 5–7 dots
* Larger spacing

Level 16+:

* 8–12 dots
* Complex shapes
* Tighter spacing

Optional advanced rule (later):

* Crossing line = fail

But not needed in v1.

---

# 7️⃣ Flutter Tech Stack

Use:

## Option A (Simpler)

CustomPainter + GestureDetector

Good if levels are static.

## Option B (More Structured)

Use **Flame**

Better if:

* Many animations
* Complex collision
* Future features

For speed + control:
👉 CustomPainter is enough.

---

# 8️⃣ Folder Structure

```id="s1x92k"
lib/
 ├── main.dart
 ├── screens/
 │     ├── home_screen.dart
 │     ├── level_select_screen.dart
 │     ├── game_screen.dart
 │     └── result_screen.dart
 ├── models/
 │     └── level_model.dart
 ├── game/
 │     ├── dot.dart
 │     ├── game_controller.dart
 │     └── path_tracker.dart
 ├── services/
 │     └── storage_service.dart
 └── widgets/
       └── primary_button.dart
```

---

# 9️⃣ Data Storage (Local Only)

Use:

* shared_preferences

Store:

* highestUnlockedLevel
* starsPerLevel
* totalStars
* totalTimePlayed

No backend needed.

---

# 🔟 Star Rating System (Important for Replay)

Based on:

* Time taken
* Or number of mistakes

Example:

⭐⭐⭐ → Perfect (no mistakes, fast)
⭐⭐ → 1 small mistake
⭐ → Completed but slow

Gives replay motivation.

---

# 1️⃣1️⃣ Level Data Format

Hardcode levels as JSON list:

```id="8fd7qk"
{
  "level": 1,
  "dots": [
    {"x": 0.2, "y": 0.3, "order": 1},
    {"x": 0.5, "y": 0.6, "order": 2},
    {"x": 0.8, "y": 0.2, "order": 3}
  ]
}
```

Use percentage positions for responsiveness.

---

# 1️⃣2️⃣ UX Polish (Must Have)

### 🎨 Visual

* Clean white background
* Dots in bright colors
* Line color changes gradually
* Soft glow on active dot
* Smooth line drawing

### ✨ Micro Animations

* Dot pop when connected
* Line smooth trailing effect
* Success burst animation

### 🔊 Feedback

* Soft connect sound
* Fail vibration
* Success chime

---

# 1️⃣3️⃣ Game Feel Improvements

* Slight magnetic snap when near correct dot
* Dot grows slightly when next in order
* Smooth easing when level completes

These small touches make it feel premium.

---

# 1️⃣4️⃣ Production Checklist

* [ ] 30+ levels minimum
* [ ] Smooth 60fps drawing
* [ ] No input lag
* [ ] Works on small screens
* [ ] No accidental scroll
* [ ] Back button handling
* [ ] Tested fast swiping

---

# 1️⃣5️⃣ Timeline (Focused Build)

Day 1 → Drawing + dot detection
Day 2 → Level system + win/lose
Day 3 → UI screens
Day 4 → Polish + sounds
Day 5 → Add 30 levels

Ship in 1 week.

---

# 1️⃣6️⃣ Why This Game Works

* Extremely simple mechanic
* Skill-based
* Short levels
* Replayable
* Easy to expand later

Simple core. Strong polish. Addictive loop.

---

If you want next, I can give you:

* 🔹 Exact gesture + collision logic
* 🔹 Full GameController pseudo code
* 🔹 20 ready-made level layouts
* 🔹 Monetization strategy (ads done right)
* 🔹 Visual design system (colors + fonts)

Tell me what you want to build next.
