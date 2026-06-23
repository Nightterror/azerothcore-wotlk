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

## Add your own

Copy a section block above when you find another command worth keeping handy.
