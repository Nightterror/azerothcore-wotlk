# TBC socket gems by item level

Generated from `data/sql/base/db_world/item_template.sql` (class 3, entry 23000–39899).

Useful for playerbots IP maintenance: **item level does not track TBC gem progression** (heroic BoP vs Hyjal craft vs Sunwell).

**Total gems (class 3, TBC band):** 302  
**Socket / player gems:** 289  
**Excluded (NPC/QA/test placeholders):** 13

## Notable findings

- **187 of 289** player-relevant gems share **ItemLevel 70** (Rare and Epic quality).
  Heroic BoP (Tanzanite), Kara rare cuts (Dawnstone), Hyjal crafts (Living Ruby /
  Shadowsong), and Sunwell (Crimson Spinel) all sit in this bucket.
- Early Outland greens are **ilvl 60**; uncut ore is often **ilvl 65**.
- A small tail of entries use **ilvl 75** and **ilvl 80** in the TBC ID band
  (mostly late-patch / PvP / special items) — worth verifying if those should
  ever be socketed by bots.
- **`RequiredLevel` is 0** on most cuts in DB; gating by required level will not
  help either.

Regenerate: `python docs/_extract_tbc_gems.py`

## Summary by item level

| ItemLevel | Count | Qualities | ID range |
|-----------|------:|-----------|----------|
| 0 | 1 | Epic | 34835–34835 |
| 40 | 2 | Uncommon | 24478–24479 |
| 55 | 13 | Common | 28458–28470 |
| 60 | 56 | Epic, Rare, Uncommon | 23094–38550 |
| 65 | 5 | Uncommon | 23077–23117 |
| 70 | 187 | Epic, Rare | 23436–38538 |
| 75 | 9 | Rare, Uncommon | 34142–36932 |
| 80 | 16 | Epic, Rare | 34143–37430 |

## Full list (sorted by ilvl, then id)

| ID | Name | ItemLevel | Quality | ReqLvl | Subclass |
|----|------|----------:|---------|-------:|---------:|
| 34835 | Omar's Gem of POWAH | 0 | Epic | 0 | 0 |
| 24478 | Jaggal Pearl | 40 | Uncommon | 0 | 7 |
| 24479 | Shadow Pearl | 40 | Uncommon | 0 | 7 |
| 28458 | Bold Tourmaline | 55 | Common | 0 | 0 |
| 28459 | Delicate Tourmaline | 55 | Common | 0 | 0 |
| 28460 | Teardrop Tourmaline | 55 | Common | 0 | 0 |
| 28461 | Runed Tourmaline | 55 | Common | 0 | 0 |
| 28462 | Bright Tourmaline | 55 | Common | 0 | 0 |
| 28463 | Solid Zircon | 55 | Common | 0 | 1 |
| 28464 | Sparkling Zircon | 55 | Common | 0 | 1 |
| 28465 | Lustrous Zircon | 55 | Common | 0 | 1 |
| 28466 | Brilliant Amber | 55 | Common | 0 | 2 |
| 28467 | Smooth Amber | 55 | Common | 0 | 2 |
| 28468 | Rigid Amber | 55 | Common | 0 | 2 |
| 28469 | Gleaming Amber | 55 | Common | 0 | 2 |
| 28470 | Thick Amber | 55 | Common | 0 | 2 |
| 23094 | Teardrop Blood Garnet | 60 | Uncommon | 0 | 0 |
| 23095 | Bold Blood Garnet | 60 | Uncommon | 0 | 0 |
| 23096 | Runed Blood Garnet | 60 | Uncommon | 0 | 0 |
| 23097 | Delicate Blood Garnet | 60 | Uncommon | 0 | 0 |
| 23098 | Inscribed Flame Spessarite | 60 | Uncommon | 0 | 5 |
| 23099 | Luminous Flame Spessarite | 60 | Uncommon | 0 | 5 |
| 23100 | Glinting Flame Spessarite | 60 | Uncommon | 0 | 5 |
| 23101 | Potent Flame Spessarite | 60 | Uncommon | 0 | 5 |
| 23103 | Radiant Deep Peridot | 60 | Uncommon | 0 | 4 |
| 23104 | Jagged Deep Peridot | 60 | Uncommon | 0 | 4 |
| 23105 | Enduring Deep Peridot | 60 | Uncommon | 0 | 4 |
| 23106 | Dazzling Deep Peridot | 60 | Uncommon | 0 | 4 |
| 23108 | Glowing Shadow Draenite | 60 | Uncommon | 0 | 3 |
| 23109 | Royal Shadow Draenite | 60 | Uncommon | 0 | 3 |
| 23110 | Shifting Shadow Draenite | 60 | Uncommon | 0 | 3 |
| 23111 | Sovereign Shadow Draenite | 60 | Uncommon | 0 | 3 |
| 23113 | Brilliant Golden Draenite | 60 | Uncommon | 0 | 2 |
| 23114 | Gleaming Golden Draenite | 60 | Uncommon | 0 | 2 |
| 23115 | Thick Golden Draenite | 60 | Uncommon | 0 | 2 |
| 23116 | Rigid Golden Draenite | 60 | Uncommon | 0 | 2 |
| 23118 | Solid Azure Moonstone | 60 | Uncommon | 0 | 1 |
| 23119 | Sparkling Azure Moonstone | 60 | Uncommon | 0 | 1 |
| 23120 | Stormy Azure Moonstone | 60 | Uncommon | 0 | 1 |
| 23121 | Lustrous Azure Moonstone | 60 | Uncommon | 0 | 1 |
| 28290 | Smooth Golden Draenite | 60 | Uncommon | 0 | 2 |
| 28595 | Bright Blood Garnet | 60 | Uncommon | 0 | 0 |
| 31860 | Great Golden Draenite | 60 | Uncommon | 0 | 2 |
| 31862 | Balanced Shadow Draenite | 60 | Uncommon | 0 | 3 |
| 31864 | Infused Shadow Draenite | 60 | Uncommon | 0 | 3 |
| 31866 | Veiled Flame Spessarite | 60 | Uncommon | 0 | 5 |
| 31869 | Wicked Flame Spessarite | 60 | Uncommon | 0 | 5 |
| 32833 | Purified Jaggal Pearl | 60 | Uncommon | 0 | 3 |
| 27777 | Stark Blood Garnet | 60 | Rare | 0 | 0 |
| 27785 | Notched Deep Peridot | 60 | Rare | 0 | 4 |
| 27786 | Barbed Deep Peridot | 60 | Rare | 0 | 4 |
| 27809 | Barbed Deep Peridot | 60 | Rare | 0 | 4 |
| 27812 | Stark Blood Garnet | 60 | Rare | 0 | 0 |
| 27820 | Notched Deep Peridot | 60 | Rare | 0 | 4 |
| 28360 | Mighty Blood Garnet | 60 | Rare | 0 | 0 |
| 28361 | Mighty Blood Garnet | 60 | Rare | 0 | 0 |
| 30571 | Don Rodrigo's Heart | 60 | Rare | 0 | 0 |
| 30598 | Don Amancio's Heart | 60 | Rare | 0 | 0 |
| 32836 | Purified Shadow Pearl | 60 | Rare | 0 | 3 |
| 27679 | Sublime Mystic Dawnstone | 60 | Epic | 0 | 2 |
| 28118 | Runed Ornate Ruby | 60 | Epic | 0 | 0 |
| 28119 | Smooth Ornate Dawnstone | 60 | Epic | 0 | 2 |
| 28120 | Gleaming Ornate Dawnstone | 60 | Epic | 0 | 2 |
| 28123 | Potent Ornate Topaz | 60 | Epic | 0 | 5 |
| 28362 | Bold Ornate Ruby | 60 | Epic | 0 | 0 |
| 28363 | Inscribed Ornate Topaz | 60 | Epic | 0 | 5 |
| 38545 | Bold Ornate Ruby | 60 | Epic | 0 | 0 |
| 38546 | Gleaming Ornate Dawnstone | 60 | Epic | 0 | 2 |
| 38547 | Inscribed Ornate Topaz | 60 | Epic | 0 | 5 |
| 38548 | Potent Ornate Topaz | 60 | Epic | 0 | 5 |
| 38549 | Runed Ornate Ruby | 60 | Epic | 0 | 0 |
| 38550 | Smooth Ornate Dawnstone | 60 | Epic | 0 | 2 |
| 23077 | Blood Garnet | 65 | Uncommon | 0 | 0 |
| 23079 | Deep Peridot | 65 | Uncommon | 0 | 4 |
| 23107 | Shadow Draenite | 65 | Uncommon | 0 | 3 |
| 23112 | Golden Draenite | 65 | Uncommon | 0 | 2 |
| 23117 | Azure Moonstone | 65 | Uncommon | 0 | 1 |
| 23436 | Living Ruby | 70 | Rare | 0 | 0 |
| 23437 | Talasite | 70 | Rare | 0 | 4 |
| 23438 | Star of Elune | 70 | Rare | 0 | 1 |
| 23439 | Noble Topaz | 70 | Rare | 0 | 5 |
| 23440 | Dawnstone | 70 | Rare | 0 | 2 |
| 23441 | Nightseye | 70 | Rare | 0 | 3 |
| 24027 | Bold Living Ruby | 70 | Rare | 0 | 0 |
| 24028 | Delicate Living Ruby | 70 | Rare | 0 | 0 |
| 24029 | Teardrop Living Ruby | 70 | Rare | 0 | 0 |
| 24030 | Runed Living Ruby | 70 | Rare | 0 | 0 |
| 24031 | Bright Living Ruby | 70 | Rare | 0 | 0 |
| 24032 | Subtle Living Ruby | 70 | Rare | 0 | 0 |
| 24033 | Solid Star of Elune | 70 | Rare | 0 | 1 |
| 24035 | Sparkling Star of Elune | 70 | Rare | 0 | 1 |
| 24036 | Flashing Living Ruby | 70 | Rare | 0 | 0 |
| 24037 | Lustrous Star of Elune | 70 | Rare | 0 | 1 |
| 24039 | Stormy Star of Elune | 70 | Rare | 0 | 1 |
| 24047 | Brilliant Dawnstone | 70 | Rare | 0 | 2 |
| 24048 | Smooth Dawnstone | 70 | Rare | 0 | 2 |
| 24050 | Gleaming Dawnstone | 70 | Rare | 0 | 2 |
| 24051 | Rigid Dawnstone | 70 | Rare | 0 | 2 |
| 24052 | Thick Dawnstone | 70 | Rare | 0 | 2 |
| 24053 | Mystic Dawnstone | 70 | Rare | 0 | 2 |
| 24054 | Sovereign Nightseye | 70 | Rare | 0 | 3 |
| 24055 | Shifting Nightseye | 70 | Rare | 0 | 3 |
| 24056 | Glowing Nightseye | 70 | Rare | 0 | 3 |
| 24057 | Royal Nightseye | 70 | Rare | 0 | 3 |
| 24058 | Inscribed Noble Topaz | 70 | Rare | 0 | 5 |
| 24059 | Potent Noble Topaz | 70 | Rare | 0 | 5 |
| 24060 | Luminous Noble Topaz | 70 | Rare | 0 | 5 |
| 24061 | Glinting Noble Topaz | 70 | Rare | 0 | 5 |
| 24062 | Enduring Talasite | 70 | Rare | 0 | 4 |
| 24065 | Dazzling Talasite | 70 | Rare | 0 | 4 |
| 24066 | Radiant Talasite | 70 | Rare | 0 | 4 |
| 24067 | Jagged Talasite | 70 | Rare | 0 | 4 |
| 25867 | Earthstorm Diamond | 70 | Rare | 0 | 6 |
| 25868 | Skyfire Diamond | 70 | Rare | 0 | 6 |
| 25890 | Destructive Skyfire Diamond | 70 | Rare | 0 | 6 |
| 25893 | Mystical Skyfire Diamond | 70 | Rare | 0 | 6 |
| 25894 | Swift Skyfire Diamond | 70 | Rare | 0 | 6 |
| 25895 | Enigmatic Skyfire Diamond | 70 | Rare | 0 | 6 |
| 25896 | Powerful Earthstorm Diamond | 70 | Rare | 0 | 6 |
| 25897 | Bracing Earthstorm Diamond | 70 | Rare | 0 | 6 |
| 25898 | Tenacious Earthstorm Diamond | 70 | Rare | 0 | 6 |
| 25899 | Brutal Earthstorm Diamond | 70 | Rare | 0 | 6 |
| 25901 | Insightful Earthstorm Diamond | 70 | Rare | 0 | 6 |
| 28556 | Swift Windfire Diamond | 70 | Rare | 0 | 6 |
| 28557 | Swift Starfire Diamond | 70 | Rare | 0 | 6 |
| 31861 | Great Dawnstone | 70 | Rare | 0 | 2 |
| 31863 | Balanced Nightseye | 70 | Rare | 0 | 3 |
| 31865 | Infused Nightseye | 70 | Rare | 0 | 3 |
| 31867 | Veiled Noble Topaz | 70 | Rare | 0 | 5 |
| 31868 | Wicked Noble Topaz | 70 | Rare | 0 | 5 |
| 32409 | Relentless Earthstorm Diamond | 70 | Rare | 0 | 6 |
| 32410 | Thundering Skyfire Diamond | 70 | Rare | 0 | 6 |
| 32634 | Unstable Amethyst | 70 | Rare | 0 | 5 |
| 32635 | Unstable Peridot | 70 | Rare | 0 | 5 |
| 32636 | Unstable Sapphire | 70 | Rare | 0 | 5 |
| 32637 | Unstable Citrine | 70 | Rare | 0 | 5 |
| 32638 | Unstable Topaz | 70 | Rare | 0 | 5 |
| 32639 | Unstable Talasite | 70 | Rare | 0 | 4 |
| 32640 | Potent Unstable Diamond | 70 | Rare | 0 | 6 |
| 32641 | Imbued Unstable Diamond | 70 | Rare | 0 | 6 |
| 33060 | Soulbound Test Gem | 70 | Rare | 0 | 8 |
| 33782 | Steady Talasite | 70 | Rare | 0 | 4 |
| 34220 | Chaotic Skyfire Diamond | 70 | Rare | 0 | 6 |
| 34627 | Heavy Tonk Armor | 70 | Rare | 0 | 2 |
| 34831 | Eye of the Sea | 70 | Rare | 0 | 1 |
| 34967 | Juno's Test Gem | 70 | Rare | 0 | 8 |
| 35315 | Quick Dawnstone | 70 | Rare | 0 | 2 |
| 35316 | Reckless Noble Topaz | 70 | Rare | 0 | 5 |
| 35318 | Forceful Talasite | 70 | Rare | 0 | 4 |
| 35501 | Eternal Earthstorm Diamond | 70 | Rare | 0 | 6 |
| 35503 | Ember Skyfire Diamond | 70 | Rare | 0 | 6 |
| 35707 | Regal Nightseye | 70 | Rare | 0 | 3 |
| 38538 | Riding Crop | 70 | Rare | 0 | 6 |
| 30546 | Sovereign Tanzanite | 70 | Epic | 0 | 3 |
| 30547 | Luminous Fire Opal | 70 | Epic | 0 | 5 |
| 30548 | Polished Chrysoprase | 70 | Epic | 0 | 4 |
| 30549 | Shifting Tanzanite | 70 | Epic | 0 | 3 |
| 30550 | Sundered Chrysoprase | 70 | Epic | 0 | 4 |
| 30551 | Infused Fire Opal | 70 | Epic | 0 | 5 |
| 30552 | Blessed Tanzanite | 70 | Epic | 0 | 3 |
| 30553 | Pristine Fire Opal | 70 | Epic | 0 | 5 |
| 30554 | Stalwart Fire Opal | 70 | Epic | 0 | 5 |
| 30555 | Glowing Tanzanite | 70 | Epic | 0 | 3 |
| 30556 | Glinting Fire Opal | 70 | Epic | 0 | 5 |
| 30558 | Glimmering Fire Opal | 70 | Epic | 0 | 5 |
| 30559 | Etched Fire Opal | 70 | Epic | 0 | 5 |
| 30560 | Rune Covered Chrysoprase | 70 | Epic | 0 | 4 |
| 30563 | Regal Tanzanite | 70 | Epic | 0 | 3 |
| 30564 | Shining Fire Opal | 70 | Epic | 0 | 5 |
| 30565 | Assassin's Fire Opal | 70 | Epic | 0 | 5 |
| 30566 | Defender's Tanzanite | 70 | Epic | 0 | 3 |
| 30572 | Imperial Tanzanite | 70 | Epic | 0 | 3 |
| 30573 | Mysterious Fire Opal | 70 | Epic | 0 | 5 |
| 30574 | Brutal Tanzanite | 70 | Epic | 0 | 3 |
| 30575 | Nimble Fire Opal | 70 | Epic | 0 | 5 |
| 30581 | Durable Fire Opal | 70 | Epic | 0 | 5 |
| 30582 | Deadly Fire Opal | 70 | Epic | 0 | 5 |
| 30583 | Timeless Chrysoprase | 70 | Epic | 0 | 4 |
| 30584 | Enscribed Fire Opal | 70 | Epic | 0 | 5 |
| 30585 | Glistening Fire Opal | 70 | Epic | 0 | 5 |
| 30586 | Seer's Chrysoprase | 70 | Epic | 0 | 4 |
| 30587 | Champion's Fire Opal | 70 | Epic | 0 | 5 |
| 30588 | Potent Fire Opal | 70 | Epic | 0 | 5 |
| 30589 | Dazzling Chrysoprase | 70 | Epic | 0 | 4 |
| 30590 | Enduring Chrysoprase | 70 | Epic | 0 | 4 |
| 30591 | Empowered Fire Opal | 70 | Epic | 0 | 5 |
| 30592 | Steady Chrysoprase | 70 | Epic | 0 | 4 |
| 30593 | Iridescent Fire Opal | 70 | Epic | 0 | 5 |
| 30594 | Effulgent Chrysoprase | 70 | Epic | 0 | 4 |
| 30600 | Fluorescent Tanzanite | 70 | Epic | 0 | 3 |
| 30601 | Beaming Fire Opal | 70 | Epic | 0 | 5 |
| 30602 | Jagged Chrysoprase | 70 | Epic | 0 | 4 |
| 30603 | Royal Tanzanite | 70 | Epic | 0 | 3 |
| 30604 | Resplendent Fire Opal | 70 | Epic | 0 | 5 |
| 30605 | Vivid Chrysoprase | 70 | Epic | 0 | 4 |
| 30606 | Lambent Chrysoprase | 70 | Epic | 0 | 4 |
| 30607 | Splendid Fire Opal | 70 | Epic | 0 | 5 |
| 30608 | Radiant Chrysoprase | 70 | Epic | 0 | 4 |
| 31116 | Infused Amethyst | 70 | Epic | 0 | 3 |
| 31117 | Soothing Amethyst | 70 | Epic | 0 | 3 |
| 31118 | Pulsing Amethyst | 70 | Epic | 0 | 3 |
| 32193 | Bold Crimson Spinel | 70 | Epic | 0 | 0 |
| 32194 | Delicate Crimson Spinel | 70 | Epic | 0 | 0 |
| 32195 | Teardrop Crimson Spinel | 70 | Epic | 0 | 0 |
| 32196 | Runed Crimson Spinel | 70 | Epic | 0 | 0 |
| 32197 | Bright Crimson Spinel | 70 | Epic | 0 | 0 |
| 32198 | Subtle Crimson Spinel | 70 | Epic | 0 | 0 |
| 32199 | Flashing Crimson Spinel | 70 | Epic | 0 | 0 |
| 32200 | Solid Empyrean Sapphire | 70 | Epic | 0 | 1 |
| 32201 | Sparkling Empyrean Sapphire | 70 | Epic | 0 | 1 |
| 32202 | Lustrous Empyrean Sapphire | 70 | Epic | 0 | 1 |
| 32203 | Stormy Empyrean Sapphire | 70 | Epic | 0 | 1 |
| 32204 | Brilliant Lionseye | 70 | Epic | 0 | 2 |
| 32205 | Smooth Lionseye | 70 | Epic | 0 | 2 |
| 32206 | Rigid Lionseye | 70 | Epic | 0 | 2 |
| 32207 | Gleaming Lionseye | 70 | Epic | 0 | 2 |
| 32208 | Thick Lionseye | 70 | Epic | 0 | 2 |
| 32209 | Mystic Lionseye | 70 | Epic | 0 | 2 |
| 32210 | Great Lionseye | 70 | Epic | 0 | 2 |
| 32211 | Sovereign Shadowsong Amethyst | 70 | Epic | 0 | 3 |
| 32212 | Shifting Shadowsong Amethyst | 70 | Epic | 0 | 3 |
| 32213 | Balanced Shadowsong Amethyst | 70 | Epic | 0 | 3 |
| 32214 | Infused Shadowsong Amethyst | 70 | Epic | 0 | 3 |
| 32215 | Glowing Shadowsong Amethyst | 70 | Epic | 0 | 3 |
| 32216 | Royal Shadowsong Amethyst | 70 | Epic | 0 | 3 |
| 32217 | Inscribed Pyrestone | 70 | Epic | 0 | 5 |
| 32218 | Potent Pyrestone | 70 | Epic | 0 | 5 |
| 32219 | Luminous Pyrestone | 70 | Epic | 0 | 5 |
| 32220 | Glinting Pyrestone | 70 | Epic | 0 | 5 |
| 32221 | Veiled Pyrestone | 70 | Epic | 0 | 5 |
| 32222 | Wicked Pyrestone | 70 | Epic | 0 | 5 |
| 32223 | Enduring Seaspray Emerald | 70 | Epic | 0 | 4 |
| 32224 | Radiant Seaspray Emerald | 70 | Epic | 0 | 4 |
| 32225 | Dazzling Seaspray Emerald | 70 | Epic | 0 | 4 |
| 32226 | Jagged Seaspray Emerald | 70 | Epic | 0 | 4 |
| 32227 | Crimson Spinel | 70 | Epic | 0 | 0 |
| 32228 | Empyrean Sapphire | 70 | Epic | 0 | 1 |
| 32229 | Lionseye | 70 | Epic | 0 | 2 |
| 32230 | Shadowsong Amethyst | 70 | Epic | 0 | 3 |
| 32231 | Pyrestone | 70 | Epic | 0 | 5 |
| 32249 | Seaspray Emerald | 70 | Epic | 0 | 4 |
| 32735 | Radiant Spencerite | 70 | Epic | 0 | 4 |
| 33131 | Crimson Sun | 70 | Epic | 0 | 0 |
| 33132 | Delicate Fire Ruby | 70 | Epic | 0 | 0 |
| 33133 | Don Julio's Heart | 70 | Epic | 0 | 0 |
| 33134 | Kailee's Rose | 70 | Epic | 0 | 0 |
| 33135 | Falling Star | 70 | Epic | 0 | 1 |
| 33137 | Sparkling Falling Star | 70 | Epic | 0 | 1 |
| 33138 | Mystic Bladestone | 70 | Epic | 0 | 2 |
| 33139 | Brilliant Bladestone | 70 | Epic | 0 | 2 |
| 33140 | Blood of Amber | 70 | Epic | 0 | 2 |
| 33141 | Great Bladestone | 70 | Epic | 0 | 2 |
| 33142 | Rigid Bladestone | 70 | Epic | 0 | 2 |
| 33143 | Stone of Blades | 70 | Epic | 0 | 2 |
| 33144 | Facet of Eternity | 70 | Epic | 0 | 2 |
| 34256 | Charmed Amani Jewel | 70 | Epic | 0 | 1 |
| 35487 | Bright Crimson Spinel | 70 | Epic | 0 | 0 |
| 35488 | Runed Crimson Spinel | 70 | Epic | 0 | 0 |
| 35489 | Teardrop Crimson Spinel | 70 | Epic | 0 | 0 |
| 35758 | Steady Seaspray Emerald | 70 | Epic | 0 | 4 |
| 35759 | Forceful Seaspray Emerald | 70 | Epic | 0 | 4 |
| 35760 | Reckless Pyrestone | 70 | Epic | 0 | 5 |
| 35761 | Quick Lionseye | 70 | Epic | 0 | 2 |
| 37503 | Purified Shadowsong Amethyst | 70 | Epic | 0 | 3 |
| 36783 | Northsea Pearl | 75 | Uncommon | 0 | 7 |
| 36917 | Bloodstone | 75 | Uncommon | 0 | 0 |
| 36920 | Sun Crystal | 75 | Uncommon | 0 | 2 |
| 36923 | Chalcedony | 75 | Uncommon | 0 | 1 |
| 36926 | Shadow Crystal | 75 | Uncommon | 0 | 3 |
| 36929 | Huge Citrine | 75 | Uncommon | 0 | 5 |
| 36932 | Dark Jade | 75 | Uncommon | 0 | 4 |
| 34142 | Infinite Sphere | 75 | Rare | 0 | 8 |
| 36784 | Siren's Tear | 75 | Rare | 0 | 7 |
| 34143 | Chromatic Sphere | 80 | Rare | 0 | 8 |
| 36918 | Scarlet Ruby | 80 | Rare | 0 | 0 |
| 36921 | Autumn's Glow | 80 | Rare | 0 | 2 |
| 36924 | Sky Sapphire | 80 | Rare | 0 | 1 |
| 36927 | Twilight Opal | 80 | Rare | 0 | 3 |
| 36930 | Monarch Topaz | 80 | Rare | 0 | 5 |
| 36933 | Forest Emerald | 80 | Rare | 0 | 4 |
| 37430 | Solid Sky Sapphire (Unused) | 80 | Rare | 70 | 1 |
| 36766 | Bright Dragon's Eye | 80 | Epic | 0 | 0 |
| 36767 | Solid Dragon's Eye | 80 | Epic | 0 | 1 |
| 36919 | Cardinal Ruby | 80 | Epic | 0 | 0 |
| 36922 | King's Amber | 80 | Epic | 0 | 2 |
| 36925 | Majestic Zircon | 80 | Epic | 0 | 1 |
| 36928 | Dreadstone | 80 | Epic | 0 | 3 |
| 36931 | Ametrine | 80 | Epic | 0 | 5 |
| 36934 | Eye of Zul | 80 | Epic | 0 | 4 |

## Excluded placeholders (NPC / QA / test)

| ID | Name | ItemLevel | Quality |
|----|------|----------:|---------|
| 23158 | NPC Equip 23158 | 0 | Poor |
| 23159 | NPC Equip 23159 | 0 | Poor |
| 32855 | NPC Equip 32855 | 0 | Poor |
| 33130 | NPC Equip 33130 | 0 | Poor |
| 33136 | NPC Equip 33136 | 0 | Poor |
| 33633 | NPC Equip 33633 | 0 | Poor |
| 38292 | Test Living Ruby | 70 | Rare |
| 38498 | QA Test Blank Purple Gem | 1 | Common |
| 38499 | NPC Equip 38499 | 0 | Poor |
| 38500 | NPC Equip 38500 | 0 | Poor |
| 38501 | NPC Equip 38501 | 0 | Poor |
| 38502 | NPC Equip 38502 | 0 | Poor |
| 38503 | NPC Equip 38503 | 0 | Poor |
