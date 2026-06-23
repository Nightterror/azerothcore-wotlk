# TBC enchant progression tier map

Implemented in `IsEnchantSpellAllowedForProgression()` (`ProgressionGearLimits.cpp`).

See also: [playerbots-tbc-gems-by-ilvl.md](playerbots-tbc-gems-by-ilvl.md).

## How maintenance picks enchants today

1. Startup builds `enchantSpellIdCache` from **every** spell with `SPELL_EFFECT_ENCHANT_ITEM`.
2. Maintenance loops each equipped item, filters spells, picks **highest stat score**.
3. Gating today is **expansion-only**: block spell ≥ 27899 in classic, spell ≥ 44483 in TBC.
4. Bots do not use scrolls/formulas — they apply the enchant spell directly.

Within TBC phase, **all ~16k+ cached enchant spells compete**. Only a **small subset** have raid-only formulas and high enough stats to “win” early.

## Proposed model (same idea as gems)

```text
Default: TBC enchant spell allowed at IP tier >= 9
Override table: spell ID -> minimum IP tier (only where source is later than Kara)
```

No change to classic (< 27899) or WotLK (≥ 44483) expansion floors.

## IP tiers (match gem gating)

| IP tier | Milestone | Enchant content |
|--------:|-----------|-----------------|
| 9 | Kara / early TBC | Trainer, vendor, heroic, Kara drops (Major Striking, Mongoose, Cat’s Swiftness, etc.) |
| 10 | Hyjal / TK | Sunfire, Soulfrost, Potency, Major Spellpower (weapon), bracer spellpower |
| 11 | Black Temple | Spellsurge, Battlemaster, glove major spellpower, Steelweave |
| 12 | ZA / Sunwell | Executioner, Deathfrost |

## Override list (spell IDs to gate)

These are the enchants worth caring about for progression — **~20 spells**, not hundreds.

### Weapons (where wrong picks hurt most)

| Spell ID | Enchant | Min tier | Typical formula source |
|---------:|---------|--------:|------------------------|
| 27967 | Major Striking | 9 | Heroic / Kara (Major Striking) |
| 27984 | Mongoose | 9 | Kara — Moroes |
| 27981 | Sunfire | 10 | Hyjal / BT trash |
| 27982 | Soulfrost | 10 | Hyjal / BT trash |
| 27972 | Potency | 10 | BT (Strength +20) |
| 27975 | Major Spellpower | 10 | TK / SSC |
| 28003 | Spellsurge | 11 | BT — Mother Shahraz |
| 28004 | Battlemaster | 11 | BT |
| 42974 | Executioner | 12 | Zul’Aman |
| 46578 | Deathfrost | 12 | Sunwell / late TBC event |

### Bracers / gloves / boots / cloak (secondary)

| Spell ID | Enchant | Min tier | Notes |
|---------:|---------|--------:|-------|
| 27917 | Bracer — Spellpower | 10 | Rare formula (ilvl 72) |
| 33997 | Gloves — Major Spellpower | 11 | BT formula |
| 34007 | Boots — Cat’s Swiftness | 9 | Kara-era BoE formula |
| 34008 | Boots — Boar’s Speed | 9 | Kara-era BoE formula |
| 34005 | Cloak — Greater Arcane Resistance | 9 | Kara rep / early |
| 34006 | Cloak — Greater Shadow Resistance | 9 | Kara rep / early |
| 47051 | Cloak — Steelweave | 11 | BT-era |

### Ring enchants (only if bots ever enchant rings)

| Spell ID | Enchant | Min tier | Notes |
|---------:|---------|--------:|-------|
| 27924 | Ring — Spellpower | 10 | Enchanter-only slot; may not apply today |
| 27926 | Ring — Healing | 10 | Same |
| 27927 | Ring — Stats | 10 | Same |

## Explicitly **not** gated (stay tier 9 default)

- **Trainer / vendor TBC enchants**: Exceptional Stats (27960), Major Intellect (27968), Fortitude, Dexterity, etc.
- **Classic enchants** (spell < 27899): Crusader, +15 Agi/Str (23800/23799), MC/ZG glove enchants (25072 Threat, etc.) — already allowed whenever classic+TBC phase allows TBC content… at tier 9 TBC phase applies so classic spells still allowed.
- **Scroll-only greens** — same spell ID as craft; if the spell is allowed, scroll and formula are equivalent for bots.
- **Shoulder enchants** — Naxx 40 Sapphiron spells already removed from `enchantSpellIdCache`.

## Scale check

| Category | Approx. count |
|----------|---------------|
| All spells in `enchantSpellIdCache` | ~thousands |
| TBC band spells (27899–44482) | ~hundreds |
| **Proposed tier overrides** | **~20** |
| Formulas with quality Rare+ in TBC band (DB) | ~40 (many duplicates / classic IDs) |

Your assumption is right: **only a handful** need explicit gates. The rest are either (a) already blocked by expansion floor, (b) never win stat scoring, or (c) correctly available from Kara onward.

## Implementation

Live in `ProgressionGearLimits.cpp`: `kTbcEnchantTierOverrides` + `GetRequiredIpTierForTbcEnchantSpell()`.

## Resolved decisions

1. Classic raid enchants at tier 9 — allowed (no override).
2. Potency / Major Spellpower — tier 10.
3. Ring enchants — skipped for v1.
4. Deathfrost — tier 12.
