# Playerbots commands — quick reference

Personal cheat sheet for commands used often. Add new sections as needed.

See also: [Playerbots Wiki — commands](https://github.com/mod-playerbots/mod-playerbots/wiki)

## How to run commands

| Channel | Example | Notes |
|---------|---------|-------|
| Party | `/p equip upgrade` | All bots in your party |
| Whisper | `equip upgrade` | One bot |
| Direct action | `do equip upgrade` | Runs immediately; bypasses normal command queue |

---

## Gear — equip upgrades from bags

Scan inventory and equip anything that beats what is worn (same logic as auto-loot upgrades).

| Command | What it does |
|---------|----------------|
| `equip upgrade` | Scan bags, equip better items on demand |
| `do equip upgrade` | Same as above; immediate execution |

**Automatic triggers** (no command needed):

- New item received (`item push result`)
- Trade accepted
- Loot roll won
- Occasional random check while out of combat

**Related config** (`playerbots.conf`):

| Setting | Default | Meaning |
|---------|---------|---------|
| `AiPlayerbot.AutoEquipUpgradeLoot` | `1` | Enable automatic upgrade equip on loot/trade |
| `AiPlayerbot.EquipUpgradeThreshold` | `1.1` | New item must be 10% higher gear score to replace |

**Code** (if wiring into scripts/modules):

```cpp
botAI->DoSpecificAction("equip upgrade", Event(), true);
```

Packet/auto-loot variant (respects `AutoEquipUpgradeLoot`):

```cpp
botAI->DoSpecificAction("equip upgrades packet action");
```

---

## Gear — full regen (different from upgrade scan)

| Command | What it does |
|---------|----------------|
| `autogear` | Wipe and regenerate gear from scratch (quality/ilvl capped by config) |
| `autogear bis` | Equip BiS from `playerbots_bis_gear` table |
| `autogear bis 55` | BiS at explicit ilvl (must be ≤ `AutoGearScoreLimit`) |

Requires `AiPlayerbot.AutoGearCommand = 1`. BiS requires `AutoGearBisCommand = 1` and `AutoGearQualityLimit = 4`.

---

## Talents — spec and dual spec

Swap premade talent builds or flip WoW dual-spec tabs (useful for PvE vs PvP).

| Command | What it does |
|---------|----------------|
| `talents` | Show current spec + command help |
| `talents spec list` | List premade specs for that bot's class (names from `PremadeSpecName` in conf) |
| `talents spec <name>` | Apply a premade by exact name, e.g. `talents spec combat pvp` |
| `talents switch 1` | Activate dual-spec tab 1 |
| `talents switch 2` | Activate dual-spec tab 2 (learns dual spec if eligible) |
| `talents apply <link>` | Apply talents from a talent-calc link |
| `talents autopick` | Auto-pick a generic talent tree |

**Typical PvE / PvP flow with dual spec:**

1. On tab 1: `talents spec frost pve` (or your PvE premade)
2. `talents switch 2`, then `talents spec frost pvp`
3. Before arena/BG: `talents switch 2`; before PvE: `talents switch 1`

Or use a single spec tab and `talents spec <name>` when you want to swap.

---

## Outfit — saved gear sets

Named item sets per bot (saved in bot data). Build gear once, then swap with one command.

| Command | What it does |
|---------|----------------|
| `outfit ?` | List saved outfits + short usage help |
| `outfit <name> update` | Save **currently equipped** items as outfit `<name>` |
| `outfit <name> equip` | Equip outfit items from bags |
| `outfit <name> replace` | Move current gear to bags, then equip outfit |
| `outfit <name> reset` | Clear outfit definition |
| `outfit <name> +[item link]` | Add item to outfit |
| `outfit <name> -[item link]` | Remove item from outfit |

**Typical PvE / PvP flow:**

1. Gear the bot for PvP (trade, vendor, etc.), then `/p outfit pvp update`
2. Gear for PvE, then `/p outfit pve update`
3. Before arena/BG: `/p outfit pvp replace`; before PvE: `/p outfit pve replace`

Items must be in the bot's bags when using `equip` or `replace`.

---

## Arena season (Individual Progression + core)

Server-wide rated arena season and vendor gear track IP tier milestones (boss clears).

### IP — status and sync (GM security 2)

| Command | What it does |
|---------|----------------|
| `.ip arenaseason info` | Show auto-advance status, server tier milestone, IP/core season, TBC/WotLK vendor seasons |
| `.ip arenaseason sync` | Recalculate tier/season from highest **normal-account** progression in the DB (excludes RNDBOT accounts) |
| `.ip get` | Show a player's personal IP tier (vendor access is per-player as well as server season) |

**Example — `.ip arenaseason info`:**

| Line | Meaning |
|------|---------|
| Arena season auto-advance | IP drives season bumps from progression (`IndividualProgression.ArenaSeasonAutoAdvance`) |
| Server IP tier milestone | Highest tier reached by a normal account (drives season advances) |
| Server arena season (IP) | Current server season (1–8) from tier mapping |
| Core rated season | What rated arena queues use (`ArenaSeasonMgr`) |
| TBC / WotLK vendor season | Which arena vendor NPC set is active per expansion band |

Tier 8 → S1 (Kara open), tier 9 → S2 (Malchezaar), … tier 16+ → S8 (ICC open). See `IndividualProgressionArenaSeason.cpp` for the full table.

**Related config** (`individualProgression.conf`):

| Setting | Default | Meaning |
|---------|---------|---------|
| `IndividualProgression.ArenaSeasonAutoAdvance` | `1` | Auto-advance season on tier milestones |
| `IndividualProgression.BotAccountsRegex` | `^RNDBOT.*` | Bot accounts excluded from DB tier sync |

### Core — end season early and distribute rewards (GM security 3)

IP commands do **not** pay out titles/gear. Use core **`.arena season`** for that.

| Command | What it does |
|---------|----------------|
| `.arena season set state 0` | Disable rated arena queue (no new matches) |
| `.arena season set state 1` | Re-enable rated arena |
| `.arena season reward all` | Pay out current season from `arena_season_reward` (all brackets) |
| `.arena season reward 2` | 2v2 only |
| `.arena season reward 3` | 3v3 only |
| `.arena season reward 5` | 5v5 only |
| `.arena season reward 2,3` | 2v2 + 3v3 combined ladder |
| `.arena season deleteteams` | Delete all arena teams (after rewards; fresh season) |
| `.arena season start $id` | Switch to season 1–8 and set state in progress |

**Typical manual end-of-season flow:**

```
.arena season set state 0
.arena season reward all
.arena season deleteteams
.arena season start 2
.arena season set state 1
```

Replace `2` with the next season id. After IP auto-advance, confirm `.ip arenaseason info` still matches core rated season and vendors.

**If `.arena season reward` fails:**

- No rated match can be in progress (wait for BGs to finish, or keep queue disabled).
- Reward rows must exist in DB for the **current** core season (`arena_season_reward`).

---

## Add your own

Copy a section block above when you find another command worth keeping handy.
