# Arena season — manual top rewards (GM)

Grant **#1 Gladiator title + top-tier mount** to roster members without meeting
ladder requirements (30 team games, 30% participation, rank, etc.).

Source of truth: `arena_season_reward` / `arena_season_reward_group` in
`acore_world` (see `data/sql/base/db_world/arena_season_reward*.sql`).

See also: [Playerbots commands — arena season](playerbots-commands-quick-reference.md#arena-season-individual-progression--core) for end-of-season rollover (`.arena season reward`, `.arena season deleteteams`, IP sync).

---

## How to grant (every season)

Run on **each character** on the team. Target the player, or pass their name where noted.

| Step | Command | Notes |
|------|---------|-------|
| Gladiator title | `.achievement add <gladiator_ach>` | Works offline: `.achievement add 418 Charname` |
| Mount | `.additem <mount_item>` | Character must be **online** |
| Mount (alt) | `.learn <mount_spell>` | Online; skips the item |
| Equip title | `.titles current <title_id>` | Online; optional |

After `.additem`, the player must **use the item once** to learn the mount unless you used `.learn`.

Verify names/IDs on your server:

```
.lookup achievement <season name>
.lookup item <mount name>
.lookup title <gladiator name>
```

There is **no** GM command to grant season rewards to a whole team or to bypass
ladder rules in bulk. `.arena season reward` always uses live ladder data and
minimum-game filters.

---

## Seasons 2–8 — Gladiator + mount

These match the **`abs` rank #1** (Gladiator achievement) and **`pct` top 0.5%**
(mount item) rows in `arena_season_reward`. For a manual “we won the season”
grant, give **both** columns to each roster member.

| Season | Name | Gladiator achievement | Title ID | Mount item | Mount spell |
|--------|------|----------------------:|---------:|-----------:|------------:|
| 8 | Wrathful | 4599 | 177 | 50435 | 71810 |
| 7 | Relentless | 3758 | 169 | 47840 | 67336 |
| 6 | Furious | 3436 | 167 | 46171 | 65439 |
| 5 | Deadly | 3336 | 157 | 46708 | 64927 |
| 4 | Brutal | 420 | 80 | 43516 | 58615 |
| 3 | Vengeful | 419 | 71 | 37676 | 49193 |
| 2 | Merciless | 418 | 62 | 34092 | 44744 |

### Example — season 2 (Merciless)

```
.achievement add 418
.additem 34092
.titles current 62
```

### Example — season 8 (Wrathful)

```
.achievement add 4599
.additem 50435
.titles current 177
```

---

## Season 1 — mount only in AC reward table

Season 1 has **no** `#1 Gladiator` row in `arena_season_reward`. The highest
tier defined there is **top 0.5%**: Swift Nether Drake + achievement 2091
(title 42, Duelist-tier — not Gladiator).

| Reward | Achievement | Title ID | Mount item | Mount spell |
|--------|------------:|---------:|-----------:|------------:|
| Top 0.5% (best tier in DB) | 2091 | 42 | 30609 | 37015 |

```
.additem 30609
.learn 37015
```

If you also want a period-appropriate **Gladiator** title for S1, AC does not
wire it into `arena_season_reward`. Use `.lookup title gladiator` / `.lookup
achievement gladiator` on your server and grant whatever matches TBC season 1
for your DBC build.

---

## Lower ladder tiers (optional)

Automated season payout also awards these **percentage-band** achievements (no
extra mount beyond the 0.5% row above). Only grant if you want the full retail
tier set, not just Gladiator + drake.

| Achievement | Title ID | Typical band |
|------------:|---------:|----------------|
| 2091 | 42 | Top 0.5% |
| 2092 | 43 | 0.5% – 3% |
| 2093 | 44 | 3% – 10% |
| 2090 | 45 | 10% – 35% |

Example for someone you want at “3% tier” only:

```
.achievement add 2093
.titles current 44
```

---

## Quick copy block (all seasons)

Replace `<name>` when granting offline achievements.

```
# S8 Wrathful
.achievement add 4599 <name>
.additem 50435
.titles current 177

# S7 Relentless
.achievement add 3758 <name>
.additem 47840
.titles current 169

# S6 Furious
.achievement add 3436 <name>
.additem 46171
.titles current 167

# S5 Deadly
.achievement add 3336 <name>
.additem 46708
.titles current 157

# S4 Brutal
.achievement add 420 <name>
.additem 43516
.titles current 80

# S3 Vengeful
.achievement add 419 <name>
.additem 37676
.titles current 71

# S2 Merciless
.achievement add 418 <name>
.additem 34092
.titles current 62

# S1 top tier in DB (drake; no Gladiator row)
.additem 30609
.learn 37015
```
