-- DB update 2026_05_29_00
DELETE FROM `acore_string` WHERE `entry` = 35453;
INSERT INTO `acore_string` (`entry`, `content_default`, `locale_koKR`, `locale_frFR`, `locale_deDE`, `locale_zhCN`, `locale_zhTW`, `locale_esES`, `locale_esMX`, `locale_ruRU`) VALUES
(35453, 'Added {} honorable kills to {}. Lifetime honorable kills: {}.', NULL, NULL, 'Es wurden {} ehrenhafte Kills zu {} hinzugefügt. Ehrenhafte Kills insgesamt: {}.', '已为 {} 添加 {} 次荣誉击杀。终身荣誉击杀：{}。', NULL, 'Se han añadido {} muertes honorables a {}. Muertes honorables totales: {}.', 'Se han añadido {} muertes honorables a {}. Muertes honorables totales: {}.', NULL);
