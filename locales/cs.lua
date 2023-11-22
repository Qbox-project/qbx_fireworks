local Translations = {
    ["placing"] = "Pokládání ohňostroje...",
    ["canceled"] = "Zrušeno..."
}

if GetConvar('qb_locale', 'en') == 'cs' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
--translate by stepan_valic