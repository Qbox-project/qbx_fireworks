local Translations = {
    ["placing"] = "Placing firework...",
    ["starting"] = "Firework starting in ~r~",
    ["canceled"] = "Canceled..."
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
