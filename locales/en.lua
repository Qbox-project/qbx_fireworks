local Translations = {
    ["placing"] = "Placing firework...",
    ["canceled"] = "Canceled..."
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
