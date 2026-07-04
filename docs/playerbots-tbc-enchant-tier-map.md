# TBC enchant progression tier map

Implemented in `IsEnchantSpellAllowedForProgression()` (`ProgressionGearLimits.cpp`).

See also: [playerbots-tbc-gems-by-ilvl.md](playerbots-tbc-gems-by-ilvl.md).

## How maintenance picks enchants

1. Startup builds `enchantSpellIdCache` from **every** spell with `SPELL_EFFECT_ENCHANT_ITEM`.
2. Maintenance loops each equipped item, filters spells, picks **highest stat score**.
3. Expansion floors: block spell ≥ 27899 in classic phase; block spell ≥ 44483 in TBC phase.
4. Bots do not use scrolls/formulas — they apply the enchant spell directly.

Within the TBC band, **all cached enchant spells compete** on stat score. Only **six** spell IDs have explicit IP tier overrides.

## Model

```text
Default: TBC enchant spell (27899–44482) allowed at IP tier >= 8
Override table: six spell IDs with higher minimum tiers
```

Classic enchants (< 27899) are never tier-gated. WotLK enchants (≥ 44483) stay blocked until WotLK content phase.

## IP tiers

| IP tier | Milestone | Enchant access |
|--------:|-----------|----------------|
| 8 | Kara / Gruul / Mag open | Default TBC band (Potency, Battlemaster, Spellsurge, Major Spellpower, bracer/glove spellpower, trainer/vendor, etc.) |
| 9 | Malchezaar (Kara clear) | + Sunfire, Soulfrost, Mongoose |
| 12 | Sunwell band (Illidan / MT / ZA / event) | + Steelweave, Executioner, Deathfrost |

## Override list (`kTbcEnchantTierOverrides`)

| Spell ID | Enchant | Min tier | Formula source (AC DB) |
|---------:|---------|--------:|------------------------|
| 27981 | Sunfire | 9 | Karazhan — Shade of Aran |
| 27982 | Soulfrost | 9 | Karazhan — Terestian Illhoof |
| 27984 | Mongoose | 9 | Karazhan — Moroes |
| 47051 | Cloak — Steelweave | 12 | Magisters' Terrace — Priestess Delrissa |
| 42974 | Executioner | 12 | Zul'Aman bosses |
| 46578 | Deathfrost | 12 | Midsummer Ice Chest (world event) |

## Explicitly not gated (tier 8 default)

Examples verified against `creature_loot_template` / `npc_vendor`:

| Spell ID | Enchant | Typical source |
|---------:|---------|------------------|
| 27972 | Potency | Sethekk / Old Hillsbrad / SSC trash (ref 24092) |
| 28004 | Battlemaster | Same ref 24092 |
| 28003 | Spellsurge | Same ref 24092 |
| 27975 | Major Spellpower | Bash'ir Landing (Outland) |
| 27917 | Bracer — Spellpower | Bloodmaul Geomancer (Blade's Edge) |
| 33997 | Gloves — Major Spellpower | Alurmi (Keepers of Time QM) |
| 27967 | Major Striking | Heroic / early TBC |
| 34007 | Boots — Cat's Swiftness | Early TBC BoE |
| 34008 | Boots — Boar's Speed | Early TBC BoE |

Also ungated: trainer/vendor TBC enchants, classic enchants (Crusader, etc.), scroll equivalents.

Shoulder enchants from Naxx40 Sapphiron are removed from `enchantSpellIdCache` at startup.

Ring enchants (27924/27926/27927) have no tier override; ring slot enchants may not apply today.

## Implementation

Live in `ProgressionGearLimits.cpp`: `kTbcEnchantTierOverrides` + `GetRequiredIpTierForTbcEnchantSpell()` (default `IP_TIER_TBC_UNLOCK`).

## Resolved decisions

1. Default TBC enchant floor — tier 8 (Kara open), not tier 9.
2. Kara-clear weapon enchants — Sunfire, Soulfrost, Mongoose at tier 9 only.
3. Late TBC — Steelweave (MT), Executioner (ZA), Deathfrost (event) at tier 12.
4. Potency / Battlemaster / Spellsurge / Major Spellpower / bracer & glove spellpower — tier 8 (no override).
5. Ring enchants — no override; scoring/slot limits unchanged.
