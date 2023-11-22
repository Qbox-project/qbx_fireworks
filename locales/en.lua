local Translations = {
    ["placing"] = "Placing firework...",
    ["need_lighter"] = "You need a lighter in order to use this...",
    ["canceled"] = "Canceled...",
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
